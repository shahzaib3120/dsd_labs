module half_adder(input i_x,i_y,i_c, output o_sum, o_carry);
	xor gate_xor(o_sum, i_x, i_y);
  and gate_and(o_carry, i_x, i_y);
endmodule
