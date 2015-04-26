`include "ripple_adder.v"
module test;
//In
reg [3:0] A;
reg [3:0] B;
reg Cin;
//Out
wire [3:0] Sum;
wire Cout;

ripple_adder uut (
  .Sum(Sum),
  .Cout(Cout),
  .A(A),
  .B(B),
  .Cin(Cin)
);
initial begin
  A = 0;
  B = 0;
  Cin = 0;

  #100;
  A=4'b0001;B=4'b0000;Cin=1'b0;
  #100 A=4'b1010;B=4'b0011;Cin=1'b0;
  #100 A=4'b1101;B=4'b1010;Cin=1'b1;
end 
initial begin
  $monitor("time = ", $time, "A=%b B=%b Cin= %b : Sum = %b Cout = %b", A,B,Cin,Sum,Cout);
end

endmodule
