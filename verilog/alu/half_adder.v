`include ""
module half_adder(
  output sum, carry,
  input A, B
);
xor(sum,A,B);
and(carry,A,B);

endmodule
