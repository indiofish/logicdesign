module D_latch(
  output Q, _Q,
  input D, E
);
reg a0, a1, a2, a3;

always @ (posedge E)
begin
  a0 <= (!D & E);
  a1 <= (D & E);
  a2 <= !(a0 | a3);
  a3 <= !(a1 | a2);
end
assign Q = a2;
assign _Q = a3;



endmodule
