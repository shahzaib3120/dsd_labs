module Lock_tb;

	reg clk, reset, open, close;
    reg [3:0] password;
	wire [6:0] HEX0,HEX1,HEX2,HEX3;

	Lock uut(
		.clk     (clk),
		.reset   (reset),
		.open    (open),
		.close   (close),
		.password(password),
		.HEX0    (HEX0),
		.HEX1    (HEX1),
		.HEX2    (HEX2),
		.HEX3    (HEX3)
		);

	always #5 clk <= ~clk;	
	initial begin
		clk = 0;reset=0;close=1;open=0;password=4'b0000;
		#10 close=0;open=1;password=4'b1010;
		#10 close=1;open=0;password=4'b0010;
		#10 close=0;open=1;password=4'b0010;
		#10 close=0;open=1;password=4'b1010;
        #10 close=1;
		#10;
	$finish;	
	end


endmodule