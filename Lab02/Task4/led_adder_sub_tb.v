
module led_adder_sub_tb;
	reg [3:0] A,B;
	reg s;
	
	// outputs
	wire a,b,c,d,e,f,g;
	wire CarryOut, Overflow;
	integer i;
	
	led_adder_sub uut(
		.A(A),
		.B(B),
		.s(s),
		.a(a),
		.b(b),
		.c(c),
		.d(d),
		.e(e),
		.f(f),
		.g(g),
		.carry(CarryOut),
		.overflow(Overflow)
	);
	
	initial begin
		for(i =0 ;i<512; i=i+1) begin
			{A,B,s} = i;
			#10;
		end
		$finish;
	end
	
endmodule

