module ram256x32_tb;
    parameter CLK_PERIOD = 10;
    reg clk;
    reg wen;
    reg enable;
    reg [7:0] address;
    reg [31:0] data_in;
    wire [31:0] data_out;
    ram256x32 dut (
        .clk(clk),
        .wen(wen),
        .enable(enable),
        .address(address),
        .data_in(data_in),
        .data_out(data_out)
    );
    always #((CLK_PERIOD / 2)) clk = ~clk;
    initial begin
        clk = 0;
        wen = 0;
        enable = 1;
        address = 0;
        data_in = 0;
        // Write random data to random addresses
        repeat (100) begin
            #CLK_PERIOD;
            wen = 1;
            address = $random;
            data_in = $random;
            #CLK_PERIOD;
            wen = 0;
        end
        // Read data from random addresses
        repeat (100) begin
            #CLK_PERIOD;
            enable = 1;
            address = $random;
            #CLK_PERIOD;
            enable = 0;
        end
        #CLK_PERIOD;
        $finish;
    end
endmodule
