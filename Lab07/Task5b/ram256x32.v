module ram256x32 (
    input clk,
    input wen,
    input enable,
    input [7:0] address,
    input [31:0] data_in,
    output [31:0] data_out
);

// Instantiate 8 instances of ram256x4
genvar i;
generate
    for (i = 0; i < 8; i = i + 1) begin : ram_inst
        ram256x4 ram_inst (
            .clk(clk),
            .wen(wen),
            .enable(enable),
            .address(address),
            .data_in(data_in[4*i +: 4]),
            .data_out(data_out[4*i +: 4])
        );
    end
endgenerate

endmodule
