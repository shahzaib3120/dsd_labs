module counter_sevenSeg(
	input clk,
	input reset,
	input enable,    // Enable input for counting
    output [6:0] led
);

	wire [3:0]bcd;
	mod_10_counter counter(
		.clk   (clk),
		.enable(enable),
		.reset (reset),
		.out   (bcd)
	);

	sevenSeg decoder(
		.bcd(bcd),
		.led(led)
	);
endmodule