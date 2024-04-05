module counter(
    input clk,       // Clock input
    input rst_n,     // Asynchronous reset input
    output [4:0] out // 5-bit output
);
	reg [4:0] count_value = 0;
	// Assign the internal register to the output
	assign out = count_value;

	// Counter logic
	always @(posedge clk or negedge rst_n) begin
	    if (~rst_n) begin
	        // Asynchronously reset the counter to 0
	        count_value <= 5'h00;
	    end else begin
	        // Increment the counter on each clock edge if enabled
	        count_value <= count_value + 1;
	    end
	end
endmodule
