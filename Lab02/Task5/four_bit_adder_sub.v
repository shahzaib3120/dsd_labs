module four_bit_adder_sub(
	input [3:0]A,B,
	input s,
	output [3:0]D,
	output CarryOut, Overflow
);
	reg [3:0] s2;
	always @* begin
		s2 = {s,s,s,s};
	end
	four_bit_adder adder_sub(
		.A(A),
		.B(B^s2),
		.CarryIn(s),
		.D(D),
		.CarryOut(CarryOut),
		.Overflow(Overflow)
	);

endmodule
