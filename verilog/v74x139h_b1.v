`timescale 1ns / 1ps
module v74x139h_b1(
  input G_L,
  input A,
  input B,
  output [3:0] Y_L
);

wire G;
wire A_L, B_L;

assign G = ~G_L;
assign A_L = ~A;
assign B_L = ~B;

assign Y_L[0] = ~(G & A_L & B_L);
assign Y_L[1] = ~(G & A & B_L);
assign Y_L[2] = ~(G & A_L & B);
assign Y_L[3] = ~(G & A & B);

endmodule
