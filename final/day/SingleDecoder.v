module SingleDecoder(
  input[4:0]number,
output A, B, C, D, E, F, G
);

reg A, B, C, D, E, F, G;

always @(number)
begin 
if(number==5'b00000)
begin
  A=1;
  B=1;
  C=0;
  D=0;
  E=1;
  F=1;
  G=0;
end
else if (number==5'b00001)
begin
  A=1;
  B=1;
  C=1;
  D=0;
  E=0;
  F=0;
  G=0;
end
else if(number==5'b00010)
begin
  A=0;
  B=0;
  C=1;
  D=1;
  E=1;
  F=0;
  G=1;
end
else if(number==5'b00011)
begin 
A=1;
B=1;
C=1;
D=0;
E=1;
F=1;
G=0;
end
else if(number==5'b00100)
begin
  A=1;
  B=1;
  C=1;
  D=0;
  E=0;
  F=0;
  G=0;
end
else if(number==5'b00101)
begin
  A=1;
  B=0;
  C=0;
  D=0;
  E=0;
  F=0;
  G=0;
end
else if(number==5'b00110)
begin
  A=0;
  B=1;
  C=1;
  D=1;
  E=1;
  F=1;
  G=0;
end
else if(number==5'b00111)
begin
  A=1;
  B=0;
  C=0;
  D=1;
  E=1;
  F=1;
  G=1;
end
else if(number==5'b01000)
begin
  A=0;
  B=0;
  C=1;
  D=1;
  E=1;
  F=1;
  G=0;
end
else if(number==5'b01001)
begin
  A=1;
  B=1;
  C=1;
  D=1;
  E=0;
  F=0;
  G=0;
end
else if(number==5'b01010)
begin
  A=1;
  B=1;
  C=1;
  D=1;
  E=0;
  F=0;
  G=1;
end
else if(number==5'b01011)
begin 
A=0;
B=1;
C=1;
D=0;
E=1;
F=1;
G=1;
end
else if(number==5'b01100)
begin
  A=1;
  B=0;
  C=0;
  D=0;
  E=1;
  F=1;
  G=1;
end
else if(number==5'b01101)
begin
  A=0;
  B=0;
  C=0;
  D=0;
  E=1;
  F=0;
  G=1;
end
else if(number==5'b01110)
begin
  A=0;
  B=0;
  C=0;
  D=0;
  E=1;
  F=1;
  G=0;
end
else if(number==5'b01111)
begin
  A=1;
  B=0;
  C=1;
  D=1;
  E=0;
  F=1;
  G=1;
end
else if(number==5'b10000)
begin 
A=1;
B=1;
C=1;
D=0;
E=1;
F=1;
G=1;
end
end
endmodule
