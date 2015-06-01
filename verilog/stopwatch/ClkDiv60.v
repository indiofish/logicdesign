module ClkDiv60(
  output newclk,
  input clk
);

integer div = 5;
reg newclk = 0;

always @(posedge clk) 
begin
  if (div != 0)
  begin
    newclk <= 0;
    div <= div - 1;
  end
  if (div == 0)
  begin
    div <= 5;
    newclk <= 1;
  end
  end
endmodule
