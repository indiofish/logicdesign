`include "v74x139_full.v"
module testbench;
//In
reg G_L1;
reg G_L2;
reg A1;
reg A2;
reg B1;
reg B2;

//Out
wire [7:0] sel;

v74x139_full uut(
  .G_L1(G_L1),
  .G_L2(G_L2),
  .A1(A1),
  .A2(A2),
  .B1(B1),
  .B2(B2),
  .sel(sel)
);

initial begin
  G_L1 = 0; G_L2 = 0;
  A1 = 0; A2 = 0;
  B1 = 0; B2 = 0;

  #100;
  G_L1 = 1; G_L2=1;A1 = 1'bx;B1=1'bx;A2=1'bx;B2=1'bX;
  #100;
  G_L1 = 0;G_L2=0;A1 =1'b0;B1=1'b0;A2=1'b0;B2=1'b0;
  #100;
  G_L1 = 0;G_L2=0;A1 =1'b0;B1=1'b1;A2=1'b0;B2=1'b1;
  #100;
  G_L1 = 0;G_L2=0;A1 =1'b1;B1=1'b1;A2=1'b1;B2=1'b1;
  #100;
  G_L1 = 0;G_L2=0;A1 =1'b1;B1=1'b0;A2=1'b1;B2=1'b0;

end 
initial begin
  $monitor("time = ",$time," G_L1=%b G_L2=%b A1= %b B1= %b A2= %b B2= %b sel 0 ~ 7 %b",
    G_L1,G_L2,A1,B1,A2,B2,sel[7:0]);
end 

endmodule
