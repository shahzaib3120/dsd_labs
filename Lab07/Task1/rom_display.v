module rom_display (
	input [3:0] address,
	output [6:0] HEX0, HEX1
);
	wire [7:0] data;
	rom rom_unit(
		.address(address),
		.data   (data),
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