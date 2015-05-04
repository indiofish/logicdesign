`include "./half_alu.v"
//`include "./full_adder.v"

module alu (
  output c0, c1,c2, c3,
  input a0, b0, a1, b1, o1, o2, o3
);
wire c0, c1;
reg c2, c3;
//internal cout.
wire cout;
wire cout2;

//first cin of ha1 is automatically 0
half_alu ha1(c0,cout,a0,b0,o1,o2,o3,0);
//cout of ha1 goes in to ha2's cin.
half_alu ha2(c1,cout2,a1,b1,o1,o2,o3,cout);

always @ (a0 or b0 or a1 or b1)
begin
  if (a0==b0 & a1 == b1)
    c3 = 1;
  else
    c3 = 0;
end
 
always @ (a0 or b0 or a1 or b1 or cout2)
begin
  if (o1&o2&o3)
    c2 = cout2;
  else
    c2 = 0;
end

endmodule
