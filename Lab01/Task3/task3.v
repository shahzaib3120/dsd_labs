module mux_2to1(input x,y,s, output m);
	assign m=(~s&x)|(s&y);
endmodule


module task3(input u,v,w,x, input[1:0]s, output m);
	wire m1,m2, m3;
	mux_2to1 uut0(
		.x(u),
		.y(v),
		.s(s[0]),
		.m(m1)
	);
	
	mux_2to1 uut1(
		.x(w),
		.y(x),
		.s(s[0]),
		.m(m2)
	);
	
	mux_2to1 uut2(
		.x(m1),
		.y(m2),
		.s(s[1]),
		.m(m3)
	);
	
	assign m = m3;
	
endmodule
