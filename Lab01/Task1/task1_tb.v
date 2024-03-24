module task1_tb;

  reg [9:0] sw;
  wire [9:0] led;

  task1 uut (
    .sw(sw),
    .led(led)
  );

  
  initial begin
  
    sw = 10'b1010101010;
    $display("Initial values - sw: %b, led: %b", sw, led);
    #10;
    $display("Final values - sw: %b, led: %b", sw, led);
    $finish;
	 
  end

endmodule
