module four_bit_reg (
	input clk,    // Clock
	input rst,  // synchronous reset active high
	input [3:0] data,
	input load,
	output reg [3:0] Q
);

	always @(posedge clk) begin : proc_state
		if(rst)
			Q <= 0;
		else if (load)
			Q <= data;
		else
			Q <= Q;
	end


endmodule
