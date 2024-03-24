module full_adder_tb;
	reg A,B,CarryIn;
	wire Sum, CarryOut;
	integer i;
	
	full_adder uut (
    .A(A),
    .B(B),
    .CarryIn(CarryIn),
    .Sum(Sum),
    .CarryOut(CarryOut)
	);
	
	initial begin
		for(i=0 ; i<8 ; i=i+1) begin
			{A,B,CarryIn} = i;
			#10 $display("Input: A=%b, B=%b, Cin=%b. Output: Sum=%b, Cout=%b", A,B,CarryIn,Sum,CarryOut);
		end
		$finish;
	end
	
	
	
endmodule
