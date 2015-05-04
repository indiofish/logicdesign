`include "./D_flipflop.v"
module counter_3bit (
  output [2:0]Result,
  input [2:0]in, 
  input clk
);
wire [2:0]Result;

D_flipflop D1(Result[0],,in[0],clk),
  D2(Result[1],,in[1],clk),
  D3(Result[2],,in[2],clk);
  
endmodule
