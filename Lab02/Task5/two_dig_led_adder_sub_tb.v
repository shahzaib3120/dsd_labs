module two_dig_led_adder_sub_tb;
	reg [3:0] A,B;
	reg s;
	
	// outputs
	wire [6:0] led1, led0;
	wire Overflow;
	integer i;
	
	two_dig_led_adder_sub uut(
		.A(A),
		.B(B),
		.s(s),
		.led0(led0),
		.led1(led1),
		.overflow(Overflow)
	);
	
	initial begin
		for(i =0 ;i<512; i=i+1) begin
			{A,B,s} = i;
			#10;
		end
		$finish;
	end

endmodule
