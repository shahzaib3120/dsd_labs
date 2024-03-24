module two_dig_led_adder_sub(
	input [3:0] A,B,
	input s,
	output [6:0] led1, led0,
	output overflow
);

	wire [3:0] Sum;
	wire carry;
	
	four_bit_adder_sub alu(
		.A(A),
		.B(B),
		.s(s),
		.D(Sum),
		.CarryOut(carry),
		.Overflow(overflow)
	);
	
	sevenSeg display_decoder_0(
		.w(Sum[3]),
		.x(Sum[2]),
		.y(Sum[1]),
		.z(Sum[0]),
		.a(led0[6]),
		.b(led0[5]),
		.c(led0[4]),
		.d(led0[3]),
		.e(led0[2]),
		.f(led0[1]),
		.g(led0[0])
	);
	
	reg [3:0]disp;
	always @(*)
		disp	= carry;
	
	sevenSeg display_decoder_1(
		.w(disp[3]),
		.x(disp[2]),
		.y(disp[1]),
		.z(disp[0]),
		.a(led1[6]),
		.b(led1[5]),
		.c(led1[4]),
		.d(led1[3]),
		.e(led1[2]),
		.f(led1[1]),
		.g(led1[0])
	);

endmodule

