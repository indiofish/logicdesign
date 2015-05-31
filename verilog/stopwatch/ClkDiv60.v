module ClkDiv60(
  output newclk,
  input clk
);

integer div = 1200;
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
    div = 1200;
  end
  end
endmodule
