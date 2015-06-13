module SetDay(
  output[3:0]FirstLetter,SecondLetter,ThirdLetter,FourthLetter,
  input start, reset, up
);

reg [3:0]FirstLetter,SecondLetter,ThirdLetter,FourthLetter;
reg [2:0]current, next;
reg changeDay;

parameter mon=3'b000,
  tue=3'b001,
  wed=3'b010,
  thu=3'b011,
  fri=3'b100,
  sat=3'b101,
  sun=3'b110,
  C_SPACE=4'b0000,
  C_A=4'b0001,
  C_D=4'b0010,
  C_E=4'b0011,
  C_F=4'b0100,
  C_H=4'b0101,
  C_I=4'b0110,
  C_N=4'b0111,
  C_O=4'b1000,
  C_P=4'b1001,
  C_R=4'b1010,
  C_S=4'b1011,
  C_T=4'b1100,
  C_U=4'b1101;

always @(posedge up or posedge reset)
begin
  begin
    if(reset==1)
    begin
      changeDay<=0;
      current<=mon;
    end
    else if(current==mon&&changeDay==1)
    begin
      FirstLetter<=C_N;
      SecondLetter<=C_N;
      ThirdLetter<=C_O;
      FourthLetter<=C_N;
      next<=tue;
    end
    else if(current==tue&&changeDay==1)
    begin
      FirstLetter<=C_T;
      SecondLetter<=C_U;
      ThirdLetter<=C_E;
      FourthLetter<=C_SPACE;
      next<=wed;
    end
    else if(current==wed&&changeDay==1)
    begin
      FirstLetter<=C_U;
      SecondLetter<=C_U;
      ThirdLetter<=C_E;
      FourthLetter<=C_D;
      next<=thu;
    end
    else if(current==thu&&changeDay==1)
    begin
      FirstLetter<=C_T;
    SecondLetter<=C_H;
    ThirdLetter<=C_U;
    FourthLetter<=C_SPACE;
    next<=fri;
  end
  else if(current==fri&&changeDay==1)
  begin
    FirstLetter<=C_F;
  SecondLetter<=C_R;
  ThirdLetter<=C_I;
  FourthLetter<=C_SPACE;
  next<=sat;
end
else if(current==sat&&changeDay==1)
begin
  FirstLetter<=C_S;
SecondLetter<=C_A;
ThirdLetter<=C_T;
FourthLetter<=C_SPACE;
next<=sun;
end
else if(current==sun&&changeDay==1)
begin
  FirstLetter<=C_S;
SecondLetter<=C_U;
ThirdLetter<=C_N;
FourthLetter<=C_SPACE;
next=mon;
end
end
end

always @(posedge start)
begin
  changeDay <= ~changeDay;
end

endmodule

