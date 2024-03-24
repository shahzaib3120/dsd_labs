 module d_latch (
	input d,
	input en,
	input rst,
	output reg q,
	output qn
	);
	
	 always @ (en or rst or d) begin
		if (rst)
		 q <= 0;
		 else
		 if (en)
		 q <= d;
	 end
	 
	 assign qn = ~q;
		 
 endmodule
 