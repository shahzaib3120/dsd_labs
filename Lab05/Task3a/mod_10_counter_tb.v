`timescale 1ns/1ps
module mod_10_counter_tb;

	reg base_clk;       // Clock input
    reg reset;     // Asynchronous reset input
    reg enable;    // Enable input for counting
    wire [6:0] out; // 7-bit output

    // base clock freq = 50,000,000 => time period = 20ns
    parameter CLK_PERIOD = 20;
    always #(CLK_PERIOD/2) base_clk <= ~base_clk;

    // module
    counter_sevenSeg uut(
    	.enable(enable),
    	.led   (out),
    	.reset (reset),
    	.clk   (base_clk)
    );

    initial begin
    	base_clk = 1'b0;
    	enable = 1'b1;
    	reset = 1'b0;
    	#100
        reset = 1'b1;
        enable = 1'b1;
        #100
        reset = 1'b0;
        enable = 1'b1;
        #100
        reset = 1'b0;
        enable = 1'b0;
        #100

    	$finish;
    end

endmodule