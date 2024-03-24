module SequenceCounter(
	input clk, // Clock input
	input reset, // Asynchronous reset input
	input in_bit, // Serial input bit
	output [6:0] HEX0
	);

	wire [4:0] count;
	wire detected;

	SequenceDetector detector(
		.clk     (clk),
		.reset   (reset),
		.in_bit  (in_bit),
		.detected(detected)
		);

	counter four_bit(
	    .clk   (detected),
	    .reset (reset),
	    .enable(1),
	    .out   (count)
	);

	sevenSeg decoder(
		.bcd(count),
		.led(HEX0)
		);

endmodule