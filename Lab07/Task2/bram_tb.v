`timescale 1 ns / 1 ps
module bram_tb;

    reg clk;
    reg increment;
    reg wren;
    reg rst_n;
    reg [7:0] data_i;
    wire [7:0] data_o;
    wire [4:0] address;

    bram uut(
        .clk(clk),
        .increment(increment),
        .wren(wren),
        .rst_n(rst_n),
        .data_i(data_i),
        .data_o(data_o),
        .address(address)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        increment = 0;
        wren = 0;
        rst_n = 1;
        data_i = 8'h00;
        #10
        data_i = 8'ha2;
        wren = 1;
        #10
        wren = 0;
        #10
        increment = 1;
        #10
        increment = 0;
        #10
        data_i = 8'hc6;
        wren = 1;
        #20
        $finish;
    end
endmodule