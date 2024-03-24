module Lock(
	input clk,
	input reset,
	input open, close,
	input [3:0] password,
	output [6:0] HEX0,
	output [6:0] HEX1,
	output [6:0] HEX2,
	output [6:0] HEX3
	);

	wire [3:0] pass_ref;
	assign pass_ref = 4'b1010;
	reg state, next_state;
	reg out;
	
	parameter 	LOCKED = 1'b0,
				UNLOCKED = 1'b1;

	// State transition logic
	always @(posedge clk or posedge reset) begin
		if (reset)
			state <= LOCKED;
		else
			state <= next_state;
	end

	// Next state logic based on the current state and input bit
	always @(*) begin
		case (state)
			LOCKED:
				if (close)
					next_state = LOCKED;
				else if (open && (password == pass_ref))
					next_state = UNLOCKED;
				else	
					next_state = LOCKED;

			UNLOCKED:
				if (open)
					next_state = UNLOCKED;
				else if (close)
					next_state = LOCKED;
				else
					next_state = UNLOCKED;

			default: next_state = LOCKED;
			endcase
	end

	// Output logic: Detected signal goes high when in S4

	always @(posedge clk) begin
		if (reset)
			out <= 1'b0;
		else if (state == UNLOCKED)
			out <= 1'b1;
		else
			out <= 1'b0;
	end
	sevenSegAlphabets decoder(
		.state(state),
		.HEX0 (HEX0),
		.HEX1 (HEX1),
		.HEX2 (HEX2),
		.HEX3 (HEX3)
	);
	

endmodule