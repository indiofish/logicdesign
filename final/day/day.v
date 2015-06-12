`include "FirstLetter.v"
`include "SecondLetter.v"
`include "ThirdLetter.v"
`include "FourthLetter.v"
module day(
  input clk,
  output [27:0]seg);

reg [27:0]seg;

FirstLetter first(seg[0], seg[1], seg[2], seg[3], seg[4],seg[5], seg[6], clk);
SecondLetter second(seg[7], seg[8], seg[9], seg[10],seg[11],seg[12],seg[13],clk);
ThirdLetter third(seg[14],seg[15],seg[16],seg[17], seg[18], seg[19], seg[20],clk);
FourthLetter fourth(seg[21],seg[22], seg[23], seg[24], seg[25], seg[26],seg[27],clk);

endmodule
