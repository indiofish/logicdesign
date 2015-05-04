module jkff (
  output Q, _Q,
  input J, K, clk
);
wire Q, _Q;

always @ (clk)
begin
  if (!Q & !J & !K)
  Q <= 0;
  _Q <= 1;

  if (!Q & !J & K)
  Q <= 0;
  _Q <= 1;

  if (!Q & J & K)
  Q <= 1;
  _Q <= 0;

  if (!Q & J & K)
  Q <= 1;
  _Q <= 0;

  if (Q & !J & !K)
  Q <= 1;
  _Q <= 0;

  if (Q & !J & K)
  Q <= 0;
  _Q <= 1;

  if (Q & J & !K)
  Q <= 1;
  _Q <= 0;

  if (Q & J & K)
  Q <= 0;
  _Q <= 1;
end
endmodule
