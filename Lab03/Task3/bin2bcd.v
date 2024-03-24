module bin2bcd(input [7:0] bin, output [9:0] bcd, output [6:0] led0, led1, led2);
    // converting bin to bcd using double dabble
    reg [19:0] temp;
    // 19:16  15:12  11:8  7:0
	 integer i;
    always @(*) begin
		temp = {10'h000,bin};
		for(i=0; i<8; i=i+1) begin
			
			
			// check ones
			if (temp[11:8] >= 4'b0101 ) begin
				temp = temp+18'b00_0000_0011_0000_0000;
			end
			// check tens
			if (temp[15:12] >= 4'b0101 ) begin
				temp = temp+18'b00_0011_0000_0000_0000;
			end
			// shift left
			temp = temp << 1;
		end
    end
	 assign bcd = temp[17:8];
	 sevenSeg led_dec0(
		.bcd(temp[11:8]),
		.led(led0)
	 );
	 sevenSeg led_dec1(
		.bcd(temp[15:12]),
		.led(led1)
	 );
	 sevenSeg led_dec2(
		.bcd(temp[19:16]),
		.led(led2)
	 );
//	 assign led0 = temp[11:8];
//	 assign led1 = temp[15:12];
//	 assign led2 = temp[19:16];
endmodule
