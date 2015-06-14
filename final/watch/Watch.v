`include "./Mod2Counter.v"//hour 1 digit
`include "./Mod13Counter.v" //hour 0 digit
`include "./Mod6Counter.v" //min 1 digit
`include "./Mod10Counter.v" //min 0 digit

//able to set time 
module Watch (
  output wire[3:0] hr1, hr0, min1, min0, sec1, sec0,
  input start_resume,reset, stop, clk, setTime
);

wire min1clk, h0clk, h1clk;
Mod10Counter Sec0(sec0,);
Mod10Counter Min0(min0,min1clk,start_resume,reset,stop,clk);
Mod6Counter Min1(min1,h0clk,start_resume,reset,stop,min1clk);
Mod13Counter Hr0(hr0,h1clk,start_resume,reset,stop,h0clk);
Mod2Counter Hr1(hr1,,start_resume,reset,stop,h1clk);
  
endmodule
