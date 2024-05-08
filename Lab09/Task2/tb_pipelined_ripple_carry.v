module tb_pipelined_ripple_carry();

    // Declare signals
    reg clk;
    reg [3:0] A;
    reg [3:0] B;
    reg carry_in;
    wire [3:0] Sum;
    wire carry_out;

    // Instantiate the DUT (Device Under Test)
    pipelined_ripple_carry uut (
        .clk(clk),
        .A(A),
        .B(B),
        .carry_in(carry_in),
        .Sum(Sum),
        .carry_out(carry_out)
    );

    // Clock generation
    always #5 clk = ~clk; // Toggle clock every 5 time units

    // Reset generation
    initial begin
        clk = 0;
        #10; // Wait for 10 time units
        #10; // Wait for 10 time units
    end

    // Stimulus process
    initial begin
        // Test vectors
        A = 4'b0000; B = 4'b0000; carry_in = 0; #10;
        A = 4'b0001; B = 4'b0001; carry_in = 0; #10;
        A = 4'b0101; B = 4'b0010; carry_in = 0; #10;
        A = 4'b1111; B = 4'b0001; carry_in = 1; #10;
        
        // Add more test vectors if needed

        $finish; // End simulation
    end

    // Display outputs
    always @(posedge clk) begin
        $display("Time: %0t, A: %b, B: %b, carry_in: %b, Sum: %b, carry_out: %b",
                 $time, A, B, carry_in, Sum, carry_out);
    end

endmodule
