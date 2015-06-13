module FirstSeg(
    output A, B, C, D, E, F, G,
input [2:0]seg

);

reg A, B, C, D, E, F, G;

always @(seg)
begin 
if(seg==3'b000)//monday
begin
  A=1;
  B=1;
  C=0;
  D=0;
  E=1;
  F=1;
  G=0;
end
else if(seg==3'b001)//tuesday
begin
  A=1;
  B=1;
  C=1;
  D=0;
  E=0;
  F=0;
  G=0;
end
else if(seg==3'b010)//wednesday
begin 
A=0;
B=0;
C=0;
D=1;
E=1;
F=1;
G=0;
end
else if(seg==3'b011)//thursday
begin
  A=1;
  B=1;
  C=1;
  D=0;
  E=0;
  F=0;
  G=0;
end
else if(seg==3'b100)//friday
begin
  A=1;
  B=0;
  C=0;
  D=0;
  E=1;
  F=1;
  G=1;
end
else if(seg==3'b101)//saturday
begin
  A=1;
  B=0;
  C=1;
  D=1;
  E=0;
  F=1;
  G=1;
end
else if(seg==3'b110)//sunday
begin 
  A=1;
  B=0;
  C=1;
  D=1;
  E=0;
  F=1;
  G=1;
  next=mon;
 end
 end
endmodule
