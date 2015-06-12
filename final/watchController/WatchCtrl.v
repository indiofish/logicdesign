`include "./StopWatch.v"
`include "./AlarmModule.v"
`include "./SevenSegDecoder.v"
`include "./Watch.v"
`include "./SetTime.v"

module WatchCtrl (
  input modeAlarm, modeClock, modeStopWatch, //selection of output mode
  input resetTime, setValue, upTime, nextDigit, //change time value for alarm and watch
  input clk, stop,

  output[6:0] digit3, digit2, digit1, digit0, //SevenSegDecoder
  output alarmBeep
);

wire [3:0] d3, d2, d1, d0;
wire [3:0] hour1, hour0, min1, min0; //for SetTime
wire [3:0] disH1, disH0, disM1, disM0;


//INPUT
SetTime timeset(hour1,hour0,min1,min0,setValue,resetTime,nextDigit,upTime);

//INTERNAL MODULE
AlarmModule beep(alarmBeep,hour1,hour0,min1,min0,setValue,resetTime,clk);
//StopWatch stopwatch();
//Watch watch();


//OUTPUT
SevenSegDecoder first(disM0,digit0[0],digit0[1],digit0[2],digit0[3],digit0[4],digit0[5],digit0[6]);
SevenSegDecoder second(disM1,digit1[0],digit1[1],digit1[2],digit1[3],digit1[4],digit1[5],digit1[6]);
SevenSegDecoder third(disH0,digit2[0],digit2[1],digit2[2],digit2[3],digit2[4],digit2[5],digit2[6]);
SevenSegDecoder fourth(disH0,digit3[0],digit3[1],digit3[2],digit3[3],digit3[4],digit3[5],digit3[6]);

  
endmodule
