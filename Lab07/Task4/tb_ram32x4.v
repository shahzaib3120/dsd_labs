`timescale 1ns / 1ps
module tb_ram32x4;
    parameter CLK_PERIOD = 10; 
    reg clk;
    reg wen;
    reg enable;
    reg [4:0] address;
    reg [3:0] data_in;
    wire [3:0] data_out;
    ram32x4 uut (
        .clk(clk),
        .wen(wen),
        .address(address),
        .data_in(data_in),
        .data_out(data_out),
        .enable(enable)
    );
    always #((CLK_PERIOD / 2)) clk = ~clk;
    initial begin
        clk = 0;
        wen = 1;
        address = 0;
        data_in = 0;
        enable = 1;
        #10;
        address = 5;
        data_in = 4'ha;
        wen = 1;
        #10;
        wen = 0;
        #10;
        data_in = 4'h4;
        address = 5;
        wen = 0;
        #10;
        enable = 0;
        #10;
        $stop;
    end
endmodule
