`include "Mod6Counter.v"
`include "Mod10Counter.v"



module StopWatch(
  output wire[3:0] min0, sec1, sec0, milSec0,
  input start_resume,reset, stop, clk
);

wire min0clk, sec1clk, sec0clk;


//devide the clk and put it as input.
Mod10Counter MIL0(milSec0, sec0clk,,start_resume,reset,stop,clk,);
Mod10Counter SEC0(sec0, sec1clk,,start_resume,reset,stop,sec0clk,);
Mod6Counter SEC1(sec1, min0clk, ,start_resume,reset,stop,sec1clk,);
Mod10Counter MIN0(min0,,,start_resume,reset,stop,min0clk,);

endmodule
