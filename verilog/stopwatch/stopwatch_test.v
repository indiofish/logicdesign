`timescale 1ns/10ps
`include "./SingleDigitWatch.v"

module stopwatch_test;
wire [3:0] number;
reg start_resume, reset, stop, clk;

SingleDigitWatch uut(number,start_resume,reset,stop,clk);

initial begin
  start_resume = 0;
  reset = 1;
  clk = 0;
  $dumpfile("watch.vcd");
  $dumpvars(0,stopwatch_test);
  forever begin
    #600 clk = ~clk;
  end 
end 

initial begin
  #2300
  begin
    start_resume = 1;
    reset = 0;
  end
  #5000 $finish;
end 

initial begin
  $monitor ($time, "  output : %b", number);
end

endmodule
