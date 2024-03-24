module LockFail(
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
	reg [1:0] state, next_state;
	reg out;

	reg [1:0] failed_attemps = 0;
	
	parameter 	LOCKED = 2'b00,
				UNLOCKED = 2'b01;
				FAIL = 2'b10;

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
				else if (open) begin
					if (password == pass_ref)
						next_state = UNLOCKED
					else begin
						if (failed_attemps < 3) begin
							next_state = LOCKED;
						end else
							next_state = FAIL;
					end
				else
					next_state = LOCKED;

				end
				

			UNLOCKED:
				if (open)
					next_state = UNLOCKED;
				else if (close)
					next_state = LOCKED;
				else
					next_state = UNLOCKED;

			FAIL:
				// add 5 second delay\
				// check if 5 seconds are complete
				// if completed next = locked
				// else fail

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