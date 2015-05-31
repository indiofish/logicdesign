`include "./StopWatch.v"

module StopWatch_test;
wire [3:0] min0, sec1, sec0, milSec0;
reg start_resume, reset, stop, clk;

StopWatch uut(
  min0,sec1,sec0,milSec0,start_resume,reset,stop,clk
);

initial begin
  start_resume = 0;
  reset = 1;
  clk = 0;
  $dumpfile("watch.vcd");
  $dumpvars(0,StopWatch_test);
  forever begin
    #1 clk = ~clk;
  end 
end 

initial begin
  #9700
  begin
    reset = 0;
    start_resume = 1;
  end
  #300000 $finish;
end 

endmodule
