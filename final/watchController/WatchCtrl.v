`include "StopWatch.v"
`include "AlarmModule.v"
`include "SevenSegDecoder.v"
`include "Watch.v"
`include "SetTime.v"
`include "SetDay.v"
`include "Day.v"

module WatchCtrl ( 
  input[2:0] mode,
  input resetTime, setValue, upTime, nextd,
  input clk, start_resume, stop,
  
  //output to sevensegdecoder
  output[6:0] d3, d2, d1, d0,
  output alarmBeep
);

//VARIABLE DECLARTION
//TODO constants for mode
parameter WATCH = 3'b000,
  STOPWATCH = 3'b001,
  ALARM = 3'b010,
  DAY = 3'b011;

//For display
reg [3:0] dis3, dis2, dis1, dis0; 

//internal value of SetTime
wire [3:0] St_hour1, St_hour0, St_min1, St_min0;
//internal value of SetDay
wire [3:0] Sd_c3, Sd_c2, Sd_c1, Sd_c0;
wire[2:0] Sd_day;
//internal value of Watch
wire [3:0] W_hour1, W_hour0, W_min1, W_min0;
wire daypass;
//internal value of stopwatch
reg [3:0] Sw_min, Sw_sec1, Sw_sec0, Sw_milSec;
//internal value of Alarm
reg [3:0] Alm_hour1, Alm_hour0, Alm_min1, Alm_min0;
//ouput value of Alarm
wire [3:0] Alm_hour1_d, Alm_hour0_d, Alm_min1_d, Alm_min0_d;
//internal value of Day
wire [3:0] Day_3, Day_2,Day_1,Day_0;
reg[2:0] day;
//internal value for setbutton
reg set;
//internal value for 7seg display mode
reg numorchar;


//ENDOF VARIABLE DECLARTIONS

//MODULE DECLATIONS
//TODO append modules

//input
SetTime timeset(
  St_hour1,St_hour0,St_min1,St_min0,
  setValue,resetTime,nextd,upTime
);

SetDay dayset(
  Sd_c3,Sd_c2,Sd_c1,Sd_c0,
  Sd_day,
  setValue,resetTime,upTime
);

Day DayMod(
  Day_3, Day_2, Day_1, Day_0,
  day,
  start_resume,resetTime,stop,daypass,setValue
);
//ALarm module should always run
AlarmModule alm(
  alarmBeep,
  //displays saved time
  Alm_hour1_d, Alm_hour0_d, Alm_min1_d, Alm_min0_d,
  
  //internal var
  Alm_hour1, Alm_hour0, Alm_min1, Alm_min0,
  setValue,resetTime,clk
);
//FIXME
//StopWatch stopwatch();

Watch watch(
  W_hour1, W_hour0, W_min1, W_min0,daypass,
  start_resume,resetTime,stop,clk,setValue
);




//display
SevenSegDecoder first(
  dis3, numorchar,
  d3[0],d3[1],d3[2],d3[3],d3[4],d3[5],d3[6]
);
SevenSegDecoder second(
  dis2, numorchar,
  d2[0],d2[1],d2[2],d2[3],d2[4],d2[5],d2[6]
);
SevenSegDecoder third(
  dis1, numorchar,
  d1[0],d1[1],d1[2],d1[3],d1[4],d1[5],d1[6]
);
SevenSegDecoder fourth(
  dis0, numorchar,
  d0[0],d0[1],d0[2],d0[3],d0[4],d0[5],d0[6]
);

//END OF MODULE DECLATIONS

//BEHAVIOR
//FIXME if this chatters, only use clk
always @(posedge clk) 
begin
  //setValue overrides display
  if  (setValue == 1)
  begin
    if (mode == WATCH)
    begin
      numorchar = 0;
      dis3 <= St_hour1;
      dis2 <= St_hour0;
      dis1 <= St_min1;
      dis0 <= St_min0;
      //TODO after this, give input to clock
    end
    if (mode == ALARM)
    begin
      numorchar = 0;
      dis3 <= St_hour1;
      dis2 <= St_hour0;
      dis1 <= St_min1;
      dis0 <= St_min0;

      Alm_hour1 <= St_hour1; 
      Alm_hour0 <= St_hour0; 
      Alm_min1 <=St_min1; 
      Alm_min0 <= St_min0;
    end
    if (mode == DAY)
    begin
      numorchar = 1;
      dis3 <= Sd_c3;
      dis2 <= Sd_c2;
      dis1 <= Sd_c1;
      dis0 <= Sd_c0;

      day <= Sd_day;
    end
  end

  //base mode: watch
  //FIXME fix this to switch case later
  else if (mode == WATCH)
  begin
    numorchar = 0;
    dis3 <= W_hour1;
    dis2 <= W_hour0;
    dis1 <= W_min1;
    dis0 <= W_min0;

    Alm_hour1 <= W_hour1;
    Alm_hour0 <= W_hour0; 
    Alm_min1 <=  W_min1;
    Alm_min0 <=  W_min0;
  end

  //stopwatch
  else if (mode == STOPWATCH)
  begin
    numorchar = 0;
    dis3 <= 3'b000;
    dis2 <= 3'b000;
    dis1 <= 3'b000;
    dis0 <= 3'b000;

    Alm_hour1 <= W_hour1;
    Alm_hour0 <= W_hour0;
    Alm_min1 <=  W_min1;
    Alm_min0 <=  W_min0;
  end

  //ALARM
  else if (mode == ALARM) 
  begin
    numorchar = 0;
    dis3 <= Alm_hour1_d;
    dis2 <= Alm_hour0_d;
    dis1 <= Alm_min1_d;
    dis0 <= Alm_min0_d;
  end

  else if (mode == DAY)
  begin
    numorchar = 1;
    dis3 <= Day_3;
    dis2 <= Day_2;
    dis1 <= Day_1;
    dis0 <= Day_0;
  end

end
//ENDOFBEHAVIOR


endmodule
