module fir_filter_tb ();

  // Define test parameters
  parameter integer CLK_PERIOD  = 10; // Clock period in ns
  parameter integer NUM_SAMPLES = 10; // Number of test samples

  // Input and output signals
  reg                clk;
  reg                rst_n;
  reg  signed [ 7:0] x_in;
  wire signed [17:0] y_out;

  // DUT instantiation
  fir_filter dut (
    .clk  (clk  ),
    .rst_n(rst_n),
    .x_in (x_in ),
    .y_out(y_out)
  );

  // Clock generation
  always begin
    # (CLK_PERIOD/2);
    clk = ~clk;
  end

  integer i;

  initial begin
    rst_n = 1;
    clk = 0;
    #10;
    rst_n = 0;
    #10;
    rst_n = 1;
    for (i = 0; i < NUM_SAMPLES; i = i + 1) begin
      x_in = i; // Generate random data
      # (CLK_PERIOD);
    end

    $finish;
  end


endmodule
