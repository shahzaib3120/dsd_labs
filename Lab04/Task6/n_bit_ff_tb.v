module n_bit_ff_tb;

	parameter n=4;
	reg clk, rst;
	reg [n-1:0] data;
	reg load;

	wire [n-1:0] Q;
	wire [n-1:0] Qn;

	n_bit_ff #(n) uut(
		.clk (clk),
		.rst (rst),
		.load(load),
		.data(data),
		.Q   (Q),
		.Qn  (Qn)
	);

	always #2 clk=~clk;
	initial begin
		clk = 0;
		data = 8'hfa;
		load = 1'b1;
		rst = 1'b0;
		#10;
		load = 1'b0;
		rst = 1'b1;
		#10
		load=1'b1;
		rst = 1'b0;
		#10
		load = 1'b0;
		rst = 1'b0;
		#10
		$finish;
	end
endmodule
