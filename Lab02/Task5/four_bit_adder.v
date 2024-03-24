module half_adder (input A,B, output Sum,Carry);
  xor gate_xor(Sum, A, B);
  and gate_and(Carry, A, B);
endmodule


module full_adder(input A,B,CarryIn, output Sum, CarryOut);
	wire s1,s2,c1,c2;
	half_adder add1(
		.A(A),
		.B(B),
		.Sum(s1),
		.Carry(c1)
	);
	
	half_adder add2(
		.A(s1),
		.B(CarryIn),
		.Sum(s2),
		.Carry(c2)
	);
	
	assign Sum = s2;
	or gate_or(CarryOut, c1,c2);
endmodule

module four_bit_adder(input [3:0] A,B, input CarryIn, output [3:0]D, output CarryOut, Overflow);
	wire c0,c1,c2;
	full_adder adder_0(
		.A(A[0]),
		.B(B[0]),
		.CarryIn(CarryIn),
		.Sum(D[0]),
		.CarryOut(c0)
	);
	full_adder adder_1(
		.A(A[1]),
		.B(B[1]),
		.CarryIn(c0),
		.Sum(D[1]),
		.CarryOut(c1)
	);
	full_adder adder_2(
		.A(A[2]),
		.B(B[2]),
		.CarryIn(c1),
		.Sum(D[2]),
		.CarryOut(c2)
	);
	full_adder adder_3(
		.A(A[3]),
		.B(B[3]),
		.CarryIn(c2),
		.Sum(D[3]),
		.CarryOut(CarryOut)
	);
	assign Overflow = CarryOut^c2;
endmodule
