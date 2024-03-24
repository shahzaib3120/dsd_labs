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
