`include "./alu.v"
module alu_test;
reg [2:0] o;
reg a0, a1;
reg b0, b1;

wire c0, c1,c2, c3;

alu uut (
  .c0(c0),
  .c1(c1),
  .c2(c2),
  .c3(c3),
  .a0(a0),
  .a1(a1),
  .b0(b0),
  .b1(b1),
  .o1(o[2]),
  .o2(o[1]),
  .o3(o[0])
);

initial begin 
  a0 = 0;
  a1 = 0;
  b0 = 1;
  b1 = 0;
  o = 0;
  $dumpfile("wave.vcd");
  $dumpvars(0,alu_test);
end
initial begin
  #10 {a1,a0,b1,b0,o[2],o[1],o[0]}
  ={1'b1,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1};
  #600 $finish;
end 
initial begin
  $monitor("time =", $time, " a1a0 is %b%b, b1b0 is %b%b, oper is %b output is %b%b%b, equality? %b"
  ,a1,a0,b1,b0,o,c2,c1,c0,c3);
end

endmodule
