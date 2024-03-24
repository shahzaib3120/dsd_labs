module four_in_and(input a,b,c,d, output y);
	wire m1,m2,m3;
	and g1(m1,a,b);
	and g2(m2,c,d);
	and g3(m3,m1,m2);
	
	assign y = m3;
	
endmodule
