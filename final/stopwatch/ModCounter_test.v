`timescale 1ns/10ps
`include "./SingleDigitWatch.v"

module stopwatch_test;
wire [3:0] number;
wire cout;
reg start_resume, reset, stop, clk;

SingleDigitWatch uut(number,cout,start_resume,reset,stop,clk);

initial begin
  start_resume = 0;
  reset = 1;
  clk = 0;
  $dumpfile("watch.vcd");
  $dumpvars(0,stopwatch_test);
  forever begin
    #10 clk = ~clk;
  end 
end 

initial begin
  #100
  begin
    start_resume = 1;
    reset = 0;
  end
  #200 $finish;
end 

initial begin
  $monitor ($time, "  output : %b cout: %b", number,cout);
end

endmodule
