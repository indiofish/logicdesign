module AMPM(
  output A, B, C, D, E, F, G,
  input clk
);

reg A, B, C, D, E, F, G;
reg current, next;

parameter clkcount=1'd2;
parameter AM=1'b0;
parameter PM=1'b1;

always @(clkcount)
begin
  if(current==AM)
  begin 
  A=1;
  B=1;
  C=0;
  D=1;
  E=1;
  F=1;
  G=1;
  next=PM;
end
else 
begin
  A=1;
  B=1;
  C=0;
  D=0;
  E=1;
  F=1;
  G=1;
end
end

always @(posedge clk)
begin
  begin
    if(clkcount==0)
    begin
      clkcount=1;
    current<=next;
  end
  else
  begin
    clkcount-=1;
    current<=current;
  end
end
end
endmodule
