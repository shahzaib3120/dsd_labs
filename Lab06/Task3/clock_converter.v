module clock_converter(
    input clk_50MHz, // Input clock at 50MHz
    input reset,     // Asynchronous reset
    output reg clk_1Hz = 0 // Output clock at 1Hz
);

reg [24:0] counter = 0; // 25-bit counter

always @(posedge clk_50MHz or posedge reset) begin
    if (reset) begin
        // Reset the counter and the output clock to their initial states
        counter <= 0;
        clk_1Hz <= 0;
    end
    else begin
        if(counter == 25000000) begin
            // Toggle the output clock and reset the counter
            clk_1Hz <= ~clk_1Hz;
            counter <= 0;
        end
        else begin
            // Increment the counter
            counter <= counter + 1;
        end
    end
end

endmodule