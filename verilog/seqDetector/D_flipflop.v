`include "D_latch3.v"
module D_flipflop (
  output Q, _Q,
  input data, clk
);
wire Q;
wire q, _q;
//wire blah blah;
D_latch3 DL1(q, _q, data, clk);
D_latch3 DL2(Q, _Q, q, !clk);
  
endmodule
