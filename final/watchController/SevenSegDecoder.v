module SevenSegDecoder(
  input[3:0] value,
  input mode,
  output A, B, C, D, E, F, G
);

reg A,B,C,D,E,F,G;
parameter NUMBER = 0,
ALPHABET = 1,
C_SPACE = 4'b0000,
C_A = 4'b0001,
C_D = 4'b0010,
C_E = 4'b0011,
C_F = 4'b0100,
C_H = 4'b0101,
C_I = 4'b0110,
C_N = 4'b0111,
C_O = 4'b1000,
C_P = 4'b1001,
C_R = 4'b1010,
C_S = 4'b1011,
C_T = 4'b1100,
C_U = 4'b1101;


//fix this to only combinational logic?
always @(value or mode)
begin
  if  (value == 4'b0000 && mode == NUMBER)
  begin
    A = 1;
    B = 1;
    C = 1;
    D = 1;
    E = 1;
    F = 1;
    G = 0;
  end
  else if  (value == 4'b0001 && mode == NUMBER)
  begin
    A = 0;
    B = 1;
    C = 1;
    D = 0;
    E = 0;
    F = 0;
    G = 0;
  end
  else if  (value == 4'b0010 && mode == NUMBER)
  begin
    A = 1;
    B = 1;
    C = 0;
    D = 1;
    E = 1;
    F = 0;
    G = 1;
  end
  else if  (value == 4'b0011 && mode == NUMBER)
  begin
    A = 1;
    B = 1;
    C = 1;
    D = 1;
    E = 0;
    F = 0;
    G = 1;
  end
  else if  (value == 4'b0100 && mode == NUMBER)
  begin
    A = 0;
    B = 1;
    C = 1;
    D = 0;
    E = 0;
    F = 1;
    G = 1;
  end
  else if  (value == 4'b0101 && mode == NUMBER)
  begin
    A = 1;
    B = 0;
    C = 1;
    D = 1;
    E = 0;
    F = 1;
    G = 1;
  end
  else if  (value == 4'b0110 && mode == NUMBER)
  begin
    A = 1;
    B = 0;
    C = 1;
    D = 1;
    E = 1;
    F = 1;
    G = 1;
  end
  else if  (value == 4'b0111 && mode == NUMBER)
  begin
    A = 1;
    B = 1;
    C = 1;
    D = 0;
    E = 0;
    F = 1;
    G = 0;
  end
  else if  (value == 4'b1000 && mode == NUMBER)
  begin
    A = 1;
    B = 1;
    C = 1;
    D = 1;
    E = 1;
    F = 1;
    G = 1;
  end
  else if  (value == 4'b1001 && mode == NUMBER)
  begin
    A = 1;
    B = 1;
    C = 1;
    D = 1;
    E = 0;
    F = 1;
    G = 1;
  end

  if  (value == )
end 
endmodule
