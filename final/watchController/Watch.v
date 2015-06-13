`include "./Counter/Mod6Counter.v"
`include "./Counter/Mod10Counter.v"
`include "./Counter/Mod2Counter.v"//hour 1 digit
`include "./Counter/Mod13Counter.v" //hour 0 digit

//able to set time 
module Watch (
  output[3:0] hr1, hr0, min1, min0,
  output daypass,
  input start_resume,reset, stop, clk, setTime
);

wire  hr1, hr0, min1, min0;
wire min1clk, h0clk, h1clk;

Mod10Counter Min0(min0,min1clk,start_resume,reset,stop,clk);
Mod6Counter Min1(min1,h0clk,start_resume,reset,stop,min1clk);
Mod13Counter Hr0(hr0,h1clk,start_resume,reset,stop,h0clk);
Mod2Counter Hr1(hr1,daypass,start_resume,reset,stop,h1clk);
  
endmodule
