//alu has extra input and output called cout,
//because we don't want to implement a full adder 
//which is cumbersome.
module half_alu (
  output c, cout,
  input a, b, o1, o2, o3, cin
);

reg c;
reg cout;

always @ (a or b or o1 or o2 or o3 or cin)
begin
  if (!o1 & !o2 & !o3)
    c = a;
  if (!o1 & !o2 & o3)
    c = b;
  if (!o1 & o2 & !o3) 
    c = ~a;
  if (!o1 & o2 & o3)
    c = ~b;
  if (o1 & !o2 & !o3)
    c = a&b;
  if (o1 & !o2 & o3)
    c = a|b;
  if (o1 & o2 & !o3)
    c = a ^ b;
  if (o1 & o2 & o3)
    c = a + b + cin;
    cout = (a & b) | (a^b&cin);
end

endmodule
