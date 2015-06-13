`include "characterU.v"
`include "characterP.v"
module upup(
  output [27:0]seg,
input clk
);
reg [27:0]seg;
characterU first(seg[0],seg[1],seg[2], seg[3],seg[4],seg[5],seg[6],clk);
characterP second(seg[7],seg[8],seg[9],seg[10],seg[11],seg[12],seg[13],clk);
characterU third(seg[14],seg[15],seg[16],seg[17],seg[18],seg[19],seg[20], clk);
characterP fourth(seg[21],seg[22],seg[23],seg[24],seg[25],seg[26],seg[27],clk);
endmodule
