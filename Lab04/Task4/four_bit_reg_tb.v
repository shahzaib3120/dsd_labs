module four_bit_reg_tb;
	reg clk, rst;
	reg [3:0] data;
	reg load;

	wire [3:0] Q;

	four_bit_reg uut(
		.clk (clk),
		.rst (rst),
		.load(load),
		.data(data),
		.Q   (Q)
	);

	always #2 clk=~clk;
	initial begin
		clk = 0;
		data = 4'ha;
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
