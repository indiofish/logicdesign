module ClkDiv10(
  output newclk,
  input clk
);

integer div = 9;
reg newclk = 0;

always @(posedge clk) 
begin
  if (div != 0)
  begin
    div <= div - 1;
    newclk <= 0;
  end
  if (div == 0)
  begin
    div <= 9;
    newclk <= 1;
  end
  end
endmodule
