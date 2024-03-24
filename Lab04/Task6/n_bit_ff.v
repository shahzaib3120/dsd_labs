module n_bit_ff #(parameter WIDTH=4)(
	input clk,    // Clock
	input rst,  // synchronous reset active high
	input [WIDTH-1:0] data,
	input load,
	output [WIDTH-1:0] Q,
	output [WIDTH-1:0] Qn
);

	genvar i;

	generate
		for(i=0; i<WIDTH; i=i+1) begin:ff_gen
			load_d_ff u0(
				.data(data[i]),
				.clk (clk),
				.rst (rst),
				.load(load),
				.q   (Q[i]),
				.qn  (Qn[i])
			);
		end
	endgenerate
endmodule
