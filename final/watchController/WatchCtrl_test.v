`include "./WatchCtrl.v"

module WatchCtrl_test;

reg [3:0]mode; //selection of output mode

reg resetTime, setValue, upTime, nextDigit; //change time value for alarm and watch
reg clk, stop;

wire[6:0] digit3, digit2, digit1, digit0; //SevenSegDecoder
wire alarmBeep;

WatchCtrl uut(
  mode,resetTime, setValue, upTime, nextDigit, clk, stop, digit3, digit2, digit1, digit0, alarmBeep
);

initial begin
  resetTime = 1;
  clk = 0;
  upTime = 0;
  setValue = 0;
  $dumpfile("WatchCtrl.vcd");
  $dumpvars(0,WatchCtrl_test);
  forever begin
    #1 clk = ~clk;
  end 
end 

initial begin
  #100
  begin
    resetTime <= 0;
  end
  #10 upTime = 1;
  #10 upTime = 1;
  #10 upTime = 0;
  #10 upTime = 1;
  #10 upTime = 0;
  #10 upTime = 1;
  #10 upTime = 0;
  #10 upTime = 1;
  #10 upTime = 0;
  #10 upTime = 1;
  #10 upTime = 0;
  #10 upTime = 0;
  #10 upTime = 1;
  #10 upTime = 0;
  #10 upTime = 1;
  #10 upTime = 0;
  #10 upTime = 1;
  #10 upTime = 0;
  #10 upTime = 1;
  #10 upTime = 0;
  #10 nextDigit = 1;
  #10 nextDigit = 0;
  #30 setValue = 1;
  #10 setValue = 0;
  #10 upTime = 1;
  #10 upTime = 1;
  #10 upTime = 0;
  #10 upTime = 1;
  #10 upTime = 0;
  #10 upTime = 1;
  #10 upTime = 0;
  #10 upTime = 1;
  #10 upTime = 0;
  #10 upTime = 1;
  #10 upTime = 0;
  #10 upTime = 0;
  #10 upTime = 1;
  #10 upTime = 0;
  #10 upTime = 1;
  #10 upTime = 0;
  #200 nextDigit = 1;
  #10 nextDigit = 0;
  #10 upTime = 1;
  #10 upTime = 1;
  #10 upTime = 0;
  #10 upTime = 1;
  #10 upTime = 0;
  #10 upTime = 1;
  #10 upTime = 0;
  #10 upTime = 1;
  #10 upTime = 0;
  #10 upTime = 1;
  #10 upTime = 0;
  #10 upTime = 1;
  #10 upTime = 0;
  #10 upTime = 1;
  #10 upTime = 0;
  #10 upTime = 1;
  #10 upTime = 0;
  #10 upTime = 1;
  #10 upTime = 0;
  #10 upTime = 1;
  #10 upTime = 0;
  #10 upTime = 0;
  #10 upTime = 1;
  #10 upTime = 0;
  #10 upTime = 1;
  #10 upTime = 0;
  #10 upTime = 1;
  #10 upTime = 0;
  #10 upTime = 1;
  #10 upTime = 0;
  #10 upTime = 1;
  #10 upTime = 0;
  #10 upTime = 1;
  #10 upTime = 0;
  #10 upTime = 1;
  #10 upTime = 0;
  #200 nextDigit = 1;
  #10 nextDigit = 0;
  #10 upTime = 1;
  #10 upTime = 0;
  #10 upTime = 1;
  #10 upTime = 0;
  #10 upTime = 1;
  #10 upTime = 0;
  #10 upTime = 1;
  #10 upTime = 0;
  #10 upTime = 1;
  #10 upTime = 0;

  #3000 $finish;
end 
endmodule
