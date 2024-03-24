module n_bit_reg #(parameter WIDTH=4)(
	input clk,    // Clock
	input rst,  // synchronous reset active high
	input [WIDTH-1:0] data,
	input load,
	output reg [WIDTH-1:0] Q
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
