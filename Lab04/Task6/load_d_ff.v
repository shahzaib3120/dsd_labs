module load_d_ff(
	input clk, rst,
	input data, load,
	output q, qn
);

	d_ff ff(
		.d  (rst?0:(load?data:q)),
		.clk(clk),
		.q  (q),
		.qn (qn)
	);

endmodule