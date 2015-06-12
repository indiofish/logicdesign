//based on mode, should use diffrent modulous for time???
//NO! Alarm and clock use the same time scale.
//How should we return output?
module SetTime (
  output[3:0] h1, h0, m1, m0,
  input start, reset, nextDigit, up
);

reg h1, h0, m1, m0;
//wire current, next;
reg[1:0] currNum;
reg changeTime;

always @(posedge up or posedge reset)
begin
  begin
    if  (reset == 1)
    begin
      currNum <= 0;
      changeTime <= 0;
      h1 <= 0;
      h0 <= 0;
      m1 <= 0;
      m0 <= 0;
    end
    else if  (currNum == 3 && changeTime==1)
      h1 <= (h1 + 1)%2; //TODO should change this depending on time mode
    else if  (currNum == 2&& changeTime==1)
      h0 <= (h0 + 1)%10; //can use 10 modulous instead of 12 because there is not cout
    else if  (currNum == 1&& changeTime==1)
      m1 <= (m1 + 1)%6;
    else if  (currNum == 0&& changeTime==1)
      m0 <= (m0 + 1)%10;
  end
end

always @(posedge nextDigit)
begin
  begin
    if  (currNum == 3)
      currNum <= 0;
    else
      currNum <= currNum + 1;
  end
end

//odd number of start will changeTime,
//even number of start will not
always @(posedge start)
begin
  changeTime <= ~changeTime;
end

endmodule
