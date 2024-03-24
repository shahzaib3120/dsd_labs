module mod_10_counter(
    input clk,       // Clock input
    input reset,     // Asynchronous reset input
    input enable,    // Enable input for counting
    output [3:0] out // 4-bit output
);
	reg [3:0] count_value = 0;
	// Assign the internal register to the output
	assign out = count_value;

	wire new_clk;

	clock_converter converter(
	 	.clk_50MHz(clk),
	 	.clk_1Hz  (new_clk),
	 	.reset    (reset)
	);

	// Counter logic
	always @(posedge clk or posedge reset) begin
	    if (reset) begin
	        // Asynchronously reset the counter to 0
	        count_value <= 4'b0000;
	    end else if (enable) begin
	    	if (count_value[0] & count_value[3])
	    		count_value <= 0;
	    	else
		        // Increment the counter on each clock edge if enabled
		        count_value <= count_value + 1;
	    end
	end

endmodule
