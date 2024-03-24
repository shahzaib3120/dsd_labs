`timescale 1ns / 1ps
module sr_latch_tb;
	reg S,R;
	wire Q,Qn;
	integer i;
	sr_latch uut(
		.S(S),
		.R(R),
		.Q(Q),
		.Qn(Qn)
	);
	
	initial begin
		for(i=0; i<8; i=i+1) begin
			{S,R} = i;
			#10;
		end
		$finish;
	end
endmodule
