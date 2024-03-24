module SequenceCounter_tb;

	reg clk, reset, in_bit;
	wire [6:0] hex;

	SequenceCounter uut(
		.clk   (clk),
		.in_bit(in_bit),
		.reset (reset),
		.HEX0  (hex)
		);

	always #5 clk <= ~clk;	
	initial begin
		clk = 0;reset=0;in_bit=0;
		#10 in_bit=1;
		#10 in_bit=1;
		#10 in_bit=0;
		#10 in_bit=1;
		#10 in_bit=1;
		#10;
	$finish;	
	end


endmodule