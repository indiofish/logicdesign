`include "./D_flipflop.v"
module shiftRg_3bit (
  output [2:0]Result,
  input Data, clk
);
//wire blah blah
//un# are unused(_q) wires.
wire un1, un2, un3;
D_flipflop D1(Result[0],un1,Data,clk),
 D2(Result[1],un2,Result[0],clk),
 D3(Result[2],un3,Result[1],clk);
  
endmodule
