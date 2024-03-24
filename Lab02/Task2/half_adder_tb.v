module half_adder_tb;

  reg A, B;
  wire Sum, Carry;
  integer i;

  half_adder uut (
    .i_x(A),
    .i_y(B),
    .o_sum(Sum),
    .o_carry(Carry)
  );

  initial begin
    for(i=0; i<4; i=i+1) begin
		{A,B} = i;
		#10 $display("Input: A = %b, B = %b, Output: Sum = %b, Carry = %b", A, B, Sum, Carry);
	 end

    $finish;
  end

endmodule
