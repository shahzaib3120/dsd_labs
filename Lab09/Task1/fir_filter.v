module fir_filter (
  input                clk  ,
  input                rst_n,
  input [ 7:0] x_in ,
  output reg [17:0] y_out
);

  // Delayed inputs
  reg [7:0] x_reg[4:0];

  // Filter Coefficients
  parameter [7:0]        h0 = 8'd1;
  parameter [7:0]        h1 = 8'd2;
  parameter [7:0]        h2 = 8'd3;
  parameter [7:0]        h3 = 8'd4;
  parameter [7:0]        h4 = 8'd5;
  integer i;
  // Pipeline registers
  reg signed [15:0] mult_result[4:0];
  reg signed [17:0] acc; 

  always @(posedge clk or negedge rst_n) begin

    if(~rst_n) begin
      for (i=0; i<5 ; i=i+1)
        x_reg[i] <= 8'h00;
      y_out <= 18'h0000;
    end else begin
      // Shift input samples through the delay line
      x_reg[0] <= x_in;
      x_reg[1] <= x_reg[0];
      x_reg[2] <= x_reg[1];
      x_reg[3] <= x_reg[2];
      x_reg[4] <= x_reg[3];

      // Perform multiplications
      mult_result[0] <= h0 * x_reg[0];
      mult_result[1] <= h1 * x_reg[1];
      mult_result[2] <= h2 * x_reg[2];
      mult_result[3] <= h3 * x_reg[3];
      mult_result[4] <= h3 * x_reg[4];

		acc = mult_result[0];
        for (i = 1; i < 5; i = i + 1)
            acc = acc + mult_result[i];
		
//      y_out <= h0 * x_reg[0] + h1 * x_reg[1] +  h2 * x_reg[2] + h3 * x_reg[3] +h4 * x_reg[4];

		y_out <= acc;
    end
  end

endmodule