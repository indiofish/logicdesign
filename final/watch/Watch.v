`include "./Mod2Counter.v"//hour 1 digit
`include "./Mod13Counter.v" //hour 0 digit
`include "./Mod6Counter.v" //min 1 digit
`include "./Mod10Counter.v" //min 0 digit
module Watch (
  output[3:0] hr1, hr0, min1, min0,
  input start_resume,reset, stop, clk, setTime
);
Mod10Counter minute0();
Mod6Counter minute1();
Mod13Counter hour0();
Mod2Counter hour1();
  
endmodule
