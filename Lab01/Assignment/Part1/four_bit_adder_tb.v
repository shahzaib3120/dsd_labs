module four_bit_adder_tb;

	reg [3:0] A,B;
	reg CarryIn;
	wire [3:0]D;
	wire CarryOut, Overflow;
	integer i;

	four_bit_adder uut(
		.A(A),
		.B(B),
		.CarryIn(CarryIn),
		.D(D),
		.CarryOut(CarryOut),
		.Overflow(Overflow)
	);
	
	initial begin
		$display("A + B + Carryin = D, CarryOut | Overflow");
		for(i=0; i<512; i=i+1) begin
			{A,B,CarryIn} = i;
			#10 $display("%4b + %4b + %b = %4b, %b | %b",A,B,CarryIn, D,CarryOut, Overflow);
		end
		$finish;
	end
	
endmodule
