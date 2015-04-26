`timescale 1ns / 1ps

module v74x139h_a (
  input G_L,
  input A,
  input B,
  output Y0_L,
  output Y1_L,
  output Y2_L,
  output Y3_L
);

wire A_L, B_L, G, A_i, B_i;

not U1(G, G_L);
not U2(B_L, B);
not U3(A_L, A);
not U4(B_i, B_L);
not U5(A_i, A_L);
nand U6(Y0_L, A_L, B_L, G);
nand U7(Y1_L, G, B_L, A_i);
nand U8(Y2_L, G, A_L, B_i);
nand U9(Y3_L, G, A_i, B_i);
endmodule
