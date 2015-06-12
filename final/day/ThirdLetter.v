module ThirdLetter(
    output A, B, C, D, E, F, G,
input clk

);

reg A, B, C, D, E, F, G;
reg [2:0]current, next;

parameter clkcount=1'd2;
parameter mon=3'b000,
  tue=3'b001,
  wed=3'b010,
  thu=3'b011,
  fri=3'b100,
  sat=3'b101,
  sun=3'b110;

always @(clkcount)
begin 
if(current==mon)
begin
  A=0;
  B=0;
  C=1;
  D=1;
  E=1;
  F=0;
  G=1;
next=current+1;

end
else if(current==tue)
begin
  A=0;
  B=1;
  C=1;
  D=1;
  E=1;
  F=1;
  G=0;
next=current+1;
end

else if(current==wed)
begin 
A=1;
B=0;
C=0;
D=1;
E=1;
F=1;
G=1;
next=current+1;
end
else if(current==thu)
begin
  A=0;
  B=1;
  C=1;
  D=0;
  E=1;
  F=1;
  G=1;
  next=current+1;
end
else if(current==fri)
begin
  A=0;
  B=0;
  C=0;
  D=0;
  E=1;
  F=1;
  G=0;
end
else if(current==sat)
begin
  A=1;
  B=1;
  C=1;
  D=0;
  E=0;
  F=0;
  G=0;
  next=current+1;
end
else
begin 
  A=1;
  B=1;
  C=1;
  D=0;
  E=1;
  F=1;
  G=0;
  next=mon;
 end
 end
always @(posedge clk)
begin 
begin
if(clkcount==0)
begin
  clkcount=1'd2;
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
