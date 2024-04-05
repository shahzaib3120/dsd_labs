`timescale 1ns / 1ps

module rom_counter_tb;

    parameter CLK_PERIOD = 10;

    reg clk;
    reg rst_n;
    wire [2:0] next_state;

    rom_counter uut (
        .clk(clk),
        .rst_n(rst_n),
        .next_state(next_state)
    );

    always #((CLK_PERIOD / 2)) clk = ~clk;

    initial begin
        clk = 0;
        rst_n = 0; 
        #20; 
        rst_n = 1; 
        #100; 
        $stop; 
    end

    // Display output
    always @(posedge clk) begin
        $display("Next State = %b", next_state);
    end

endmodule
