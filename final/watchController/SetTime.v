`include "Mod10Counter.v"
`include "Mod6Counter.v"

module SetTime (
  output reg[3:0] h1, h0, m1, m0,
  input start, reset, nextDigit, up
);

reg[1:0] currNum;
//reg changeTime;
wire[3:0] hour0, min1, min0;

Mod10Counter hour0mod (hour0,,,start,reset,,up,);
Mod6Counter min1mod(min1,,,start,reset,,up,);
Mod10Counter min0mod(min0,,,start,reset,,up,);
always @(posedge up or posedge reset)
begin
  begin
    if  (reset == 1)
    begin
      //   currNum <= 0;
      //      changeTime <= 0;
      h1 <= 0;
      h0 <= 0;
      m1 <= 0;
      m0 <= 0;
    end
    else if  (start == 1 && currNum == 3)
      h1 <= (h1 + 1)%2; //TODO should change this depending on time mode
    else if  (start == 1 && currNum == 2)
      h0 <=  hour0; //can use 10 modulous instead of 12 because there is not cout
    else if  (start == 1 && currNum == 1)
      m1 <= min1;
    else if  (start == 1 && currNum == 0)
      m0 <= min0;
  end
end

always @(posedge nextDigit)
begin
  begin
    if  (currNum >= 3)
      currNum <= 0;
    else
      currNum <= currNum + 1;
  end
end

//odd number of start will changeTime,
//even number of start will not

endmodule
