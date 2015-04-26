`include "v74x139h_a.v"

module v74x139_full(
  input G_L1,
  input G_L2,
  input A1,
  input A2,
  input B1,
  input B2,
  output [7:0] sel
);
//wire ;
v74x139h_a H1(G_L1,A1,B1,sel[0],sel[1],sel[2],sel[3]),
H2(G_L2,A2,B2,sel[4],sel[5],sel[6],sel[7]);

endmodule
