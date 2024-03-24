module two_digit_counter(
	input clk,
	input reset,
	input enable,    // Enable input for counting
   output [6:0] led0, led1
);

	wire [3:0]bcd0,bcd1;
	mod_10_counter counter0(
		.clk   (clk),
		.enable(enable),
		.reset (reset),
		.out   (bcd0)
	);
	
	mod_10_counter counter1(
		.clk   (bcd0[0] & bcd0[3]),
		.enable(enable),
		.reset (reset),
		.out   (bcd1)
	);

	sevenSeg decoder0(
		.bcd(bcd0),
		.led(led0)
	);
	sevenSeg decoder1(
		.bcd(bcd1),
		.led(led1)
	);
endmodule