module four_bit_adder_sub_tb;
	reg [3:0] A,B;
	reg s;
	wire [3:0]D;
	wire CarryOut, Overflow;
	integer i;
	
	four_bit_adder_sub uut(
		.A(A),
		.B(B),
		.s(s),
		.D(D),
		.CarryOut(CarryOut),
		.Overflow(Overflow)
	);
	
	initial begin
		for(i =0 ;i<512; i=i+1) begin
			{A,B,s} = i;
			#10;
		end
		$finish;
	end
	
endmodule
