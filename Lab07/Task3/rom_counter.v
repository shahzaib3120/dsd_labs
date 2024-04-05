module rom_counter (
    input clk, 
    input rst_n, 
    output [2:0] next_state 
);

	reg [2:0] rom [0:7];

	initial begin
	    rom[0] = 3'b001;
	    rom[1] = 3'b010;
	    rom[2] = 3'b011;
	    rom[3] = 3'b100;
	    rom[4] = 3'b101;
	    rom[5] = 3'b110;
	    rom[6] = 3'b111;
	    rom[7] = 3'b000;
	end

	reg [2:0] current_state;

	always @(posedge clk or negedge rst_n) begin
	    if (~rst_n) begin
	        current_state <= 3'b000;
	    end else begin
	        current_state <= rom[current_state];
	    end
	end

	assign next_state = current_state;

endmodule
