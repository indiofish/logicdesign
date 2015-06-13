`include "./WatchCtrl.v"

module WatchCtrl_test;

reg [2:0]mode; //selection of output mode

reg resetTime, setValue, upTime, nextDigit; //change time value for alarm and watch
reg clk, stop;
reg start_resume;

wire[6:0] digit3, digit2, digit1, digit0; //SevenSegDecoder
wire alarmBeep;

WatchCtrl uut(
  mode,
  resetTime, setValue, upTime, nextDigit, 
  clk, start_resume, stop, 
  digit3, digit2, digit1, digit0, 
  alarmBeep
);

initial begin
  resetTime = 1;
  clk = 0;
  upTime = 0;
  setValue = 0;
  mode = 0;
  $dumpfile("wave.vcd");
  $dumpvars(0,WatchCtrl_test);
  forever begin
    #1 clk = ~clk;
  end 
end 

initial begin
  #100
  begin
    resetTime <= 0;
    start_resume <= 1;
  end
  #1000
  mode = 3'b001;

  #3000 $finish;
end 
endmodule
