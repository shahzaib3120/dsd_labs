module task2(a, b, s, m);
	input [3:0]a,b;
	input s;
	output reg [3:0]m;
	reg [3:0] s2;
	always @* begin
    s2 = {s, s, s, s};

    m = (~s2 & a) | (s2 & b);
  end
endmodule
