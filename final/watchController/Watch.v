`include "Mod6Counter.v"
`include "Mod10Counter.v"
`include "Mod2Counter.v"//hour 1 digit
`include "Mod13Counter.v" //hour 0 digit

//able to set time 
//TODO need to have defauls time input?
module Watch (
  output wire[3:0] hr1, hr0, min1, min0, sec1, sec0,
  output daypass,
  //input[3:0] in_hr1, in_hr0, in_min1, in_min0, in_sec1, in_sec0,
  input start_resume,reset, stop, clk, setTime
);


wire sec1clk, min0clk, min1clk, h0clk, h1clk;

Mod10Counter Sec0(sec0,sec1clk,start_resume,reset,stop,clk);
Mod6Counter Sec1(sec1,min0clk,start_resume,reset,stop,sec1clk);
Mod10Counter Min0(min0,min1clk,start_resume,reset,stop,min0clk);
Mod6Counter Min1(min1,h0clk,start_resume,reset,stop,min1clk);
Mod13Counter Hr0(hr0,h1clk,start_resume,reset,stop,h0clk);
Mod2Counter Hr1(hr1,daypass,start_resume,reset,stop,h1clk);

//always @ (posedge clk)
//begin
  //hr1 = in_hr1;
  //hr0 = in_hr0;
  //min1 = in_min1;
  //min0 = in_min0;
  //sec1 = in_sec1;
  //sec0 = in_sec0;
//end


always @ (setTime)
begin
end
endmodule
