module Hz2MilSec (
  output reg signal,
  input clk, reset
);

parameter mod = 500000;
integer value;

always @ (posedge clk)
begin
  if  (reset == 1)
  begin
    value <= 0;
    signal <= 0;
  end
  else if (reset == 0)
  begin
    if  (value == 0)
    begin
      signal <= 1;
      value <= value + 1;
    end
    else if (value < mod)
    begin
      signal <= 0;
      value <= value + 1;
    end
    else
    begin
      value <= 0;
      signal <= 0;
    end
  end
end
endmodule
