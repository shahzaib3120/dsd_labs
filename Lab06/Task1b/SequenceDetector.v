module SequenceDetector(
input clk, // Clock input
input reset, // Asynchronous reset input
input in_bit, // Serial input bit
output reg detected // Output signal indicating sequence detection
);
	// Define states
	reg [2:0] state, next_state;
	parameter IDLE = 3'b000,
				S1 = 3'b001, // State after receiving '1'
				S2 = 3'b010, // State after receiving '11'
				S3 = 3'b011, // State after receiving '110'
				S4 = 3'b100; // State after receiving '1101' (sequence detected)
	// State transition logic
	always @(posedge clk or posedge reset) begin
		if (reset)
			state <= IDLE;
		else
			state <= next_state;
	end
	// Next state logic based on the current state and input bit
	always @(*) begin
		case (state)
			IDLE: next_state = in_bit ? S1 : IDLE;
			S1: next_state = in_bit ? S2 : IDLE;
			S2: next_state = in_bit ? S2 : S3;
			S3: next_state = in_bit ? S4 : IDLE;
			S4: next_state = IDLE;
			default: next_state = IDLE;
			endcase
	end
	// Output logic: Detected signal goes high when in S4
	always @(posedge clk) begin
		if (reset)
			detected <= 1'b0;
		else if (state == S4)
			detected <= 1'b1;
		else
			detected <= 1'b0;
	end
endmodule
