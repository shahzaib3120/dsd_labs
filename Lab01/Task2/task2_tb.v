module task2_tb;
	reg [3:0]a;
	reg [3:0]b;
	reg s;
	
	wire [3:0]m;
	
	task2 uut(
		.a(a),
		.b(b),
		.s(s),
		.m(m)
	);
 
	initial begin
		// Test case 1
		a = 4'b0000;
		b = 4'b1111;
		s = 1;
		#10 $display("Test Case 1 - a: %b, b: %b, s: %b, m: %b", a, b, s, m);

		// Test case 2
		a = 4'b0000;
		b = 4'b1111;
		s = 0;
		#10 $display("Test Case 2 - a: %b, b: %b, s: %b, m: %b", a, b, s, m);

		// Add more test cases as needed

		// Finish the simulation
		$finish;
	end
	
endmodule
