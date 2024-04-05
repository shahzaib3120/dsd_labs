module bram_display (
	input clk,    // Clock
	input increment,
	input wren,
	input rst_n,  // Asynchronous reset active low
	input [7:0] data_i,
	output [6:0] HEX0, HEX1, HEX4, HEX5
);

	wire [7:0] data;
	wire [4:0] address;

	bram bram_unit(
		.clk      (clk),
		.increment(increment),
		.data_i   (data_i),
		.rst_n    (rst_n),
		.wren     (wren),
		.data_o   (data),
		.address  (address)
	);

	sevenSeg add_dec(
		.bcd(address[3:0]),
		.led(HEX4)
	);

	sevenSeg add_dec1(
		.bcd(address[4]),
		.led(HEX5)
	);

	sevenSeg data_dec(
		.bcd(data[3:0]),
		.led(HEX0)
	);

	sevenSeg data_dec1(
		.bcd(data[7:4]),
		.led(HEX1)
	);

endmodule