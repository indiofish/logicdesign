module ClkDiv100(
  output newclk,
  input clk
);

integer div = 200;
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
    div = 200;
  end
  end
endmodule
