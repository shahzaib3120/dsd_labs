module four_bit_sub_tb;
	reg [3:0] A,B;
	wire [3:0]D;
	wire CarryOut, Overflow;
	integer i;

	four_bit_sub uut(
		.A(A),
		.B(B),
		.D(D),
		.CarryOut(CarryOut),
		.Overflow(Overflow)
	);
	
	initial begin
		#10 $display("A - B = D, CarryOut | Overflow");
		for(i=0; i<256; i=i+1) begin
			{A,B} = i;
			#10 $display("%4b - %4b = %4b, %b | %b",A,B, D,CarryOut, Overflow);
		end
		$finish;
	end
	
endmodule
