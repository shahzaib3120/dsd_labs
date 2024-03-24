module d_ff_tb;
	reg d,rst,clk;
	wire q,qn;
	integer i;
	d_ff uut(
		.d  (d),
		.rst(rst),
		.clk(clk),
		.q  (q),
		.qn (qn)
	);

	always #5 clk = ~clk;
	initial begin
		clk = 0;
		for (i = 0; i < 8; i=i+1) begin
			{d,rst} = i;
			#10;
		end
		$finish;
	end
endmodule
