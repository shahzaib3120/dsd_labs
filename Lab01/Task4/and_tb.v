module and_tb;
	reg a,b,c,d;
	wire y;
	integer i;
	
	four_in_and uut(
		.a(a),
		.b(b),
		.c(c),
		.d(d),
		.y(y)
	);

	initial begin
		
		for(i=0; i<16; i=i+1) begin
			{a,b,c,d} = i;
			#10 $display("%b %b %b %b | %b", a,b,c,d,y);
		end
		$finish;
	end
	
endmodule
