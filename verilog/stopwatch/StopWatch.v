`include "./SingleDigitWatch.v"
`include "./ClkDiv10.v"
`include "./ClkDiv60.v"
`include "./ClkDiv100.v"

module StopWatch(
  output[3:0] min0, sec1, sec0, milSec0,
  input start_resume,reset, stop, clk
);
wire min0,sec1,sec0,milSec0;
//Internal Variables
//min0clk becomes 1 after 60 sec clk.
//60-- everytime?
wire min0clk, sec1clk, sec0clk;


//devide the clk and put it as input.
SingleDigitWatch MIL0(milSec0, start_resume,reset,stop,clk);
ClkDiv10 secone(sec0clk,clk);
SingleDigitWatch SEC0(sec0, start_resume,reset,stop,sec0clk);
ClkDiv100 sectwo(sec1clk,clk);
SingleDigitWatch SEC1(sec1, start_resume,reset,stop,sec1clk);
ClkDiv60 minzero(min0clk,clk);
SingleDigitWatch MIN0(min0, start_resume,reset,stop,min0clk);

endmodule
