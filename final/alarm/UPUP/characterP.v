module characterP(
    output A, B, C, D, E, F, G,
input clk

);

reg A, B, C, D, E, F, G;
reg current, next;

parameter display=1;
parameter none=0;

always @(clk)
begin 
if(current==display)
begin
  A=1;
  B=1;
  C=0;
  D=0;
  E=1;
  F=1;
  G=1;
next=none;
end
else
begin
  A=0;
  B=0;
  C=0;
  D=0;
  E=0;
  F=0;
  G=0;
next=display;
end
 end

always @(posedge clk)
begin
  current<=next;
end
endmodule
