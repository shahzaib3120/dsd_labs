module d_ff(input clk, d, rst, output q, qn);
	wire q_int, qn_int;
	d_latch master(
		.d  (d),
		.q  (q_int),
		.qn (qn_int),
		.rst(rst),
		.en (~clk)
	);

	d_latch slave(
		.d  (q_int),
		.en (clk),
		.rst(rst),
		.q  (q),
		.qn (qn)
	);
endmodule
