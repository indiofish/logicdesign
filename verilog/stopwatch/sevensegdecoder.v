module sevensegdecoder (
  input[3:0] number,
  output A, B, C, D, E, F, G
);

reg A,B,C,D,E,F,G;

always @(number)
begin
  if  (number == 4'b0000)
  begin
    A = 1;
    B = 1;
    C = 1;
    D = 1;
    E = 1;
    F = 1;
    G = 0;
  end
  else if  (number == 4'b0001)
  begin
    A = 0;
    B = 1;
    C = 1;
    D = 0;
    E = 0;
    F = 0;
    G = 0;
  end
  else if  (number == 4'b0010)
  begin
    A = 1;
    B = 1;
    C = 0;
    D = 1;
    E = 1;
    F = 0;
    G = 0;
  end
  else if  (number == 4'b0011)
  begin
    A = 1;
    B = 1;
    C = 1;
    D = 1;
    E = 0;
    F = 0;
    G = 0;
  end
  else if  (number == 4'b0100)
  begin
    A = 0;
    B = 1;
    C = 1;
    D = 0;
    E = 0;
    F = 1;
    G = 1;
  end
  else if  (number == 4'b0101)
  begin
    A = 1;
    B = 0;
    C = 1;
    D = 1;
    E = 0;
    F = 1;
    G = 1;
  end
  else if  (number == 4'b0110)
  begin
    A = 1;
    B = 0;
    C = 1;
    D = 1;
    E = 1;
    F = 1;
    G = 1;
  end
  else if  (number == 4'b0111)
  begin
    A = 1;
    B = 0;
    C = 1;
    D = 0;
    E = 0;
    F = 1;
    G = 0;
  end
  else if  (number == 4'b1000)
  begin
    A = 1;
    B = 1;
    C = 1;
    D = 1;
    E = 1;
    F = 1;
    G = 1;
  end
  else if  (number == 4'b1001)
  begin
    A = 1;
    B = 1;
    C = 1;
    D = 1;
    E = 0;
    F = 1;
    G = 1;
  end
end 
endmodule
