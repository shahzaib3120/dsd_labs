module sevenSegAlphabets(
	input state,
	output reg [6:0] HEX0,
	output reg [6:0] HEX1,
	output reg [6:0] HEX2,
	output reg [6:0] HEX3
	);

	// 7'gfedcba
	// OPEN
	// CLOSE
	parameter O = 7'b1000000;
	parameter P = 7'b0001100;
	parameter E = 7'b0000110;
	parameter n = 7'b0101011;

	parameter C = 7'b1000110;
	parameter L = 7'b1000111;
	parameter S = 7'b0010010;

	always@(*) begin
		if (state) begin
			HEX3 = O;
			HEX2 = P;
			HEX1 = E;
			HEX0 = n;
		end else begin
			HEX3 = C;
			HEX2 = L;
			HEX1 = O;
			HEX0 = S;
		end
	end

endmodule
