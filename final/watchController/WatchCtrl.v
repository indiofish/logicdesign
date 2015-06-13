`include "./StopWatch.v"
`include "./AlarmModule.v"
`include "./SevenSegDecoder.v"
`include "./Watch.v"
`include "./SetTime.v"
//TODO append modules

module WatchCtrl (
  input[3:0] mode,
  input resetTime, setValue, upTime, nextd,
  input clk, start_resume, stop,
  
  //output to sevensegdecoder
  output[6:0] d3, d2, d1, d0, 

  output alarmBeep
);

//VARIABLE DECLARTION

//For display
reg [3:0] dis3, dis2, dis1, dis0; 

//internal value of SetTime
wire [3:0] St_hour1, St_hour0, St_min1, St_min0;
//internal value of Watch
wire [3:0] W_hour1, W_hour0, W_min1, W_min0;
//internal value of stopwatch
reg [3:0] Sw_min, Sw_sec1, Sw_sec0, Sw_milSec;
//internal value of Alarm
reg [3:0] Alm_hour1, Alm_hour0, Alm_min1, Alm_min0;
//internal value of Day
reg [3:0] Day_3, Day_2,Day_1,Day_0;

//endof VARIABLE DECLARTIONS

//MODOLE DECLATIONS

//input
SetTime timeset(
  St_hour1,St_hour0,St_min1,St_min0,
  setValue,resetTime,nextd,upTime
);

//internal module
AlarmModule alm(
  alarmBeep,
  //internal var
  Alm_hour1, Alm_hour0, Alm_min1, Alm_min0,
  setValue,resetTime,clk
);
StopWatch stopwatch();

Watch watch(
  W_hour1, W_hour0, W_min1, W_min0,
  start_resume,resetTime,stop,clk,setValue
);


//display
SevenSegDecoder first(
  dis3,d0[0],d0[1],d0[2],d0[3],d0[4],d0[5],d0[6]
);
SevenSegDecoder second(
  dis2,d1[0],d1[1],d1[2],d1[3],d1[4],d1[5],d1[6]
);
SevenSegDecoder third(
  dis1,d2[0],d2[1],d2[2],d2[3],d2[4],d2[5],d2[6]
);
SevenSegDecoder fourth(
  dis0,d3[0],d3[1],d3[2],d3[3],d3[4],d3[5],d3[6]
);

//end of modole declations

//BEHAVIOR
always @(posedge clk)
begin
  //setValue overrides display, changing curr mode's value
  if  (setValue == 1)
  begin
    //Watch
    if (mode == 3'b000)
    begin
      dis3 <= St_hour1;
      dis2 <= St_hour0;
      dis1 <= St_min1;
      dis0 <= St_min0;
    end
    //stopwatch
    if (mode == 3'b001)
    begin
      //dis3 <= St_hour1;
      //dis2 <= St_hour0;
      //dis1 <= St_min1;
      //dis0 <= St_min0;
    end
  end
  
  //base mod: watch
  else if (mode == 3'b000)
  begin
      dis3 <= W_hour1;
      dis2 <= W_hour0;
      dis1 <= W_min1;
      dis0 <= W_min0;
  end

  //stopwatch
  else if (mode == 3'b001) 
  begin
  end
  
end
//ENDOFBEHAVIOR

  
endmodule
