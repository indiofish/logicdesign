`include "Mod6Counter.v"
`include "Mod10Counter.v"
`include "Mod2Counter.v"//hour 1 digit
`include "Mod13Counter.v" //hour 0 digit

//able to set time 
//TODO need to have defauls time input?
module Watch (
  output wire[3:0] hr1, hr0, min1, min0, sec1, sec0,
  output daypass,
  input[3:0] in_hr1, in_hr0, in_min1, in_min0, in_sec1, in_sec0,
  input start_resume,reset, stop, clk, setTime
);


wire sec1clk, min0clk, min1clk, h0clk, h1clk;
reg[3:0] start_hr1, start_hr0, start_min1, start_min0, start_sec1, start_sec0;

Mod10Counter Sec0(sec0,sec1clk,0,start_resume,reset,stop,clk,setTime);
Mod6Counter Sec1(sec1,min0clk,0,start_resume,reset,stop,sec1clk,setTime);
Mod10Counter Min0(min0,min1clk,in_min0,start_resume,reset,stop,min0clk,setTime);
Mod6Counter Min1(min1,h0clk,in_min1,start_resume,reset,stop,min1clk,setTime);
Mod13Counter Hr0(hr0,h1clk,in_hr0,start_resume,reset,stop,h0clk,setTime);
Mod2Counter Hr1(hr1,daypass,in_hr1,start_resume,reset,stop,h1clk,setTime);

//always @ (posedge clk)
//begin
  //hr1 = in_hr1;
  //hr0 = in_hr0;
  //min1 = in_min1;
  //min0 = in_min0;
  //sec1 = in_sec1;
  //sec0 = in_sec0;
//end

always @(posedge reset)
begin
  start_hr1 <= 0;
  start_hr0<= 0;
  start_min1<= 0;
  start_min0<= 0;
  start_sec1<= 0;
  start_sec0<= 0;
end

always @ (setTime)
begin
  start_hr1 <= in_hr1;
  start_hr0 <= in_hr0;
  start_min1 <= in_min1;
  start_min0 <= in_min0;
  start_sec1 <= in_sec1;
  start_sec0 <= in_sec0;
end
endmodule
