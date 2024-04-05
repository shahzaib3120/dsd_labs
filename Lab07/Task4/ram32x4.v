module ram32x4 (
    input clk,        
    input wen,
    input enable,        
    input [4:0] address,   
    input [3:0] data_in,   
    output [3:0] data_out 
);

reg [3:0] memory [31:0];   

reg [3:0] data;

always @(posedge clk) begin
    if (wen) begin
        memory[address] <= data_in;
        data <= data_in;
    end else begin
        data <= memory[address];
    end
end

assign data_out = enable ? (data) : ({4{1'bz}});

endmodule