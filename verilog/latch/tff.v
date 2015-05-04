module tff (
  output Q, _Q,
  input T, clk
);
reg Q, _Q;
always @ (posedge clk)
begin
  if (!T & !Q)
    Q <= 0;
    _Q <= 1;

  if (!T & Q)
    Q <= 1;
    _Q <= 0;

  if (T & !Q)
    Q <= 1;
    _Q <= 0;

  if (T & Q)
    Q <= 0;
    _Q <= 1;
end
  
endmodule
