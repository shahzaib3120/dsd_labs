module task3_tb;
	reg u,v,w,x;
	reg [1:0]s;
	integer i;
	wire m;
	
	task3 uut0(
		.u(u),
		.v(v),
		.w(w),
		.x(x),
		.s(s),
		.m(m)
	);
	
	initial begin
	
		u = 1'b1;
		v = 1'b0;
		w = 1'b1;
		x = 1'b0;

		for (i =0; i < 4; i = i + 1) begin
			s = i;
			#10 $display("Test Case - s: %b, m: %b", s, m);
		end
		
		$finish;
	
	end
	
endmodule
