module rom_tb;
    reg [3:0] address;
    wire [7:0] data;
    rom uut (
        .address(address),
        .data(data)
    );
    integer i;
    initial begin
        for(i=0; i<16; i=i+1) begin
            address = i;
            #10;
        end
        $finish;
    end

endmodule