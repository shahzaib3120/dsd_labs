module d_latch_tb;
	reg 	d,en,rst;
	wire q,qn;
	integer i;
	
	d_latch uut(
		.d(d),
		.en(en),
		.rst(rst),
		.q(q),
		.qn(qn)
	);
	
	initial begin
		for(i=0; i<8;i=i+1) begin
			{d,rst,en} = i;
			#10;
		end
	end
endmodule
