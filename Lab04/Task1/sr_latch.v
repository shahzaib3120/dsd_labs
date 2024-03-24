module sr_latch(input S,R, output Q, Qn);
	wire Q_int, Qn_int;
	assign Q_int = ~(S | Qn_int);
	assign Qn_int = ~(R | Q_int);
	assign Q = Qn_int;
	assign Qn = Q_int;
endmodule
