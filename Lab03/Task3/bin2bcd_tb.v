module bin2bcd_tb;
	reg [7:0] bin;
	wire [9:0] led;
	wire [6:0] seg0, seg1, seg2;
	integer i;
	
	bin2bcd uut(
		.bin(bin),
		.bcd(led),
		.led0(seg0),
		.led1(seg1),
		.led2(seg2)
	);
	
	initial begin
		for(i=0;i<255;i=i+1) begin
			bin = i;
			#100;
		end
		$finish;
	end
endmodule
