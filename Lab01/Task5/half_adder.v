module half_adder (
  input A,
  input B,
  output Sum,
  output Carry
);

  xor gate_xor(Sum, A, B);
  and gate_and(Carry, A, B);

endmodule
