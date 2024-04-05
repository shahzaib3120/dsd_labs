module bram (
	input clk,    // Clock
	input increment,
	input wren,
	input rst_n,  // Asynchronous reset active low
	input [7:0] data_i,
	output [7:0] data_o,
	output [4:0] address
);

	counter addr_counter(
		.clk   (increment),
		.rst_n (rst_n),
		.out   (address)
	);

	ram32 ram_unit(
		.address(address),
		.clock  (clk),
		.data   (data_i),
		.wren   (wren),
		.q      (data_o)
	);

endmodule