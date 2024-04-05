module rom (
    input      [3:0] address,
    output reg [7:0] data
);
    // Read data from ROM based on address
    always @(*)
    case(address)
        4'h0 : data = 8'h0A;
        4'h1 : data = 8'h12;
        4'h2 : data = 8'h23;
        4'h3 : data = 8'h6C;
        4'h4 : data = 8'h4D;
        4'h5 : data = 8'h5F;
        4'h6 : data = 8'h00;
        4'h7 : data = 8'h13;
        4'h8 : data = 8'h0A;
        4'h9 : data = 8'h12;
        4'ha : data = 8'h23;
        4'hb : data = 8'h6C;
        4'hc : data = 8'h4D;
        4'hd : data = 8'h5F;
        4'he : data = 8'h00;
        4'hf : data = 8'h13;
        default: data = 8'h00;
    endcase

endmodule