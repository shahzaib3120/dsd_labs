module sevenSeg(input w,x,y,z, output a,b,c,d,e,f,g);
	assign a = (~w&~x&~c&d) | (~w&x&~y&~z) | (w&~x&y&z) | (w&x&~y&z);
	assign b = (x&y&~z) | (w&y&z) | (w&x&~z) |(~w&x&~y&z);
	assign c = (w&x&~z) | (w&x&y) |(~w&~x&y&~z);
	assign d = (x&y&z) | (~w&~x&~y&z) |(~w&x&~y&~z) |(w&~x&y&~z);
	assign e = (~w&z) | (~x&~y&z) |(~w&x&~y);
	assign f = (~w&~x&z) | (~w&~x&y) |(~w&y&z) |(w&x&~y&z);
	assign g = (~w&~x&~y) | (~w&x&y&z) |(w&x&~y&~z);
endmodule
