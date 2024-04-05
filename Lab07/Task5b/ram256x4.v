module ram256x4 (
    input clk,        
    input wen,
    input enable,        
    input [7:0] address,   
    input [3:0] data_in,   
    output [3:0] data_out 
);

wire [3:0] data_out_internal[7:0];
wire [7:0] demux_output;


decoder_3bit addr_dec(
	.output_bits(demux_output),
	.input_bits (address[7:5])
);

genvar i;
generate
    for (i = 0; i < 8; i = i + 1) begin : ram_inst
        ram32x4 ram_inst (
            .clk(clk),
            .wen(wen && (demux_output[i])),
            .enable(enable),
            .address(address[4:0]),
            .data_in(data_in),
            .data_out(data_out_internal[i])
        );
    end
endgenerate

encoder_3bit data_enc(
	.input_data0   (data_out_internal[0]),
	.input_data1   (data_out_internal[1]),
	.input_data2   (data_out_internal[2]),
	.input_data3   (data_out_internal[3]),
	.input_data4   (data_out_internal[4]),
	.input_data5   (data_out_internal[5]),
	.input_data6   (data_out_internal[6]),
	.input_data7   (data_out_internal[7]),
	.selection_bits(address[7:5]),
	.output_data   (data_out)
);

endmodule

module decoder_3bit (
    input [2:0] input_bits,
    output reg [7:0] output_bits
);

always @* begin
    case(input_bits)
        3'b000: output_bits = 8'b00000001;
        3'b001: output_bits = 8'b00000010;
        3'b010: output_bits = 8'b00000100;
        3'b011: output_bits = 8'b00001000;
        3'b100: output_bits = 8'b00010000;
        3'b101: output_bits = 8'b00100000;
        3'b110: output_bits = 8'b01000000;
        3'b111: output_bits = 8'b10000000;
        default: output_bits = 8'b00000000;
    endcase
end

endmodule

module encoder_3bit (
    input [3:0] input_data7, input_data6,input_data5, input_data4, input_data3, input_data2,input_data1,input_data0,
    input [2:0] selection_bits,
    output reg [4:0] output_data
);

always @* begin
    case(selection_bits)
        3'b000: output_data = input_data0;
        3'b001: output_data = input_data1;
        3'b010: output_data = input_data2;
        3'b011: output_data = input_data3;
        3'b100: output_data = input_data4;
        3'b101: output_data = input_data5;
        3'b110: output_data = input_data6;
        3'b111: output_data = input_data7;
        default: output_data = input_data0;
    endcase
end

endmodule
