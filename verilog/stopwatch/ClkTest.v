module ClkTest(
  output newclk,
  input clk
);

integer div = 60;
reg newclk = 0;

always @(clk) 
begin
  if (div != 0)
  begin
    newclk = 0;
    div = div - 1;
  end
  if (div == 0)
  begin
    newclk = 1;
    div = 60;
  end
  end
endmodule
