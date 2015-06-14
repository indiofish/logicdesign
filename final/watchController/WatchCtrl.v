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
  output[6:0] d6, d5, d4, d3, d2, d1, d0,
  output alarmBeep
);

//VARIABLE DECLARTION
//TODO constants for mode
parameter WATCH = 3'b000,
  STOPWATCH = 3'b001,
  ALARM = 3'b010,
  DAY = 3'b011;

//For display
reg [3:0] dis6, dis5, dis4, dis3, dis2, dis1, dis0; 

//internal value of SetTime
wire [3:0] St_hour1, St_hour0, St_min1, St_min0;
//internal value of SetDay
wire [3:0] Sd_c3, Sd_c2, Sd_c1, Sd_c0;
wire[2:0] Sd_day;
//internal value of Watch
wire [3:0] W_hour1, W_hour0, W_min1, W_min0, W_sec1, W_sec0;
input[3:0] in_hr1, in_hr0, in_min1, in_min0, in_sec1, in_sec0;
wire daypass;
//internal value of stopwatch
wire [3:0] Sw_min, Sw_sec1, Sw_sec0, Sw_milSec;
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

StopWatch stopwatch(
  Sw_min, Sw_sec1, Sw_sec0, Sw_milSec,
  start_resume,resetTime,stop,clk
);

Watch watch(
  W_hour1, W_hour0, W_min1, W_min0, W_sec1, W_sec0,
  daypass,
 in_hr1, in_hr0, in_min1, in_min0, in_sec1, in_sec0,
  start_resume,resetTime,stop,clk,setValue
);




//display
SevenSegDecoder first(
  dis6, numorchar,
  d6[0],d6[1],d6[2],d6[3],d6[4],d6[5],d6[6]
);
SevenSegDecoder second(
  dis5, numorchar,
  d5[0],d5[1],d5[2],d5[3],d5[4],d5[5],d5[6]
);
SevenSegDecoder third(
  dis4, numorchar,
  d4[0],d4[1],d4[2],d4[3],d4[4],d4[5],d4[6]
);
SevenSegDecoder fourth(
  dis3, numorchar,
  d3[0],d3[1],d3[2],d3[3],d3[4],d3[5],d3[6]
);
SevenSegDecoder five(
  dis2, numorchar,
  d2[0],d2[1],d2[2],d2[3],d2[4],d2[5],d2[6]
);
SevenSegDecoder six(
  dis1, numorchar,
  d1[0],d1[1],d1[2],d1[3],d1[4],d1[5],d1[6]
);
SevenSegDecoder seven(
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
      dis6 <= St_hour1;
      dis5 <= St_hour0;
      dis4 <= St_min1;
      dis3 <= St_min0;
      dis2 <= 0;
      dis1 <= 0;
      dis0 <= 0;
      //TODO after this, give input to clock
    end
    if (mode == ALARM)
    begin
      numorchar = 0;
      dis6 <= St_hour1;
      dis5 <= St_hour0;
      dis4 <= St_min1;
      dis3 <= St_min0;
      dis2 <= 0;
      dis1 <= 0;
      dis0 <= 0;

      Alm_hour1 <= St_hour1; 
      Alm_hour0 <= St_hour0; 
      Alm_min1 <=St_min1; 
      Alm_min0 <= St_min0;
    end
    if (mode == DAY)
    begin
      numorchar = 1;
      dis6 <= Sd_c3;
      dis5 <= Sd_c2;
      dis4 <= Sd_c1;
      dis3 <= Sd_c0;
      dis2 <= 0;
      dis1 <= 0;
      dis0 <= 0;

      day <= Sd_day;
    end
    else
    begin
    end
  end

  //base mode: watch
  //FIXME fix this to switch case later
  else if (mode == WATCH)
  begin
    numorchar = 0;
    dis6 <= W_hour1;
    dis5 <= W_hour0;
    dis4 <= W_min1;
    dis3 <= W_min0;
    dis2 <= W_sec1;
    dis1 <= W_sec0;
    //TODO add am/pm

    Alm_hour1 <= W_hour1;
    Alm_hour0 <= W_hour0; 
    Alm_min1 <=  W_min1;
    Alm_min0 <=  W_min0;
  end

  //stopwatch
  else if (mode == STOPWATCH)
  begin
    numorchar = 0;
    dis6 <= 0;
    dis5 <= 0;
    dis4 <= Sw_min;
    dis3 <= Sw_sec1;
    dis2 <= Sw_sec0;
    dis1 <= Sw_milSec;
    dis0 <= 0;

    Alm_hour1 <= W_hour1;
    Alm_hour0 <= W_hour0;
    Alm_min1 <=  W_min1;
    Alm_min0 <=  W_min0;
  end

  //ALARM
  else if (mode == ALARM) 
  begin
    numorchar = 0;
    dis6 <= Alm_hour1_d;
    dis5 <= Alm_hour0_d;
    dis4 <= Alm_min1_d;
    dis3 <= Alm_min0_d;
    dis2 <= 0;
    dis1 <= 0;
    dis0 <= 0;
  end

  else if (mode == DAY)
  begin
    numorchar = 1;
    dis6 <= Day_3;
    dis5 <= Day_2;
    dis4 <= Day_1;
    dis3 <= Day_0;
    dis2 <= 0;
    dis1 <= 0;
    dis0 <= 0;
  end

  else
  begin
  end

end
//ENDOFBEHAVIOR


endmodule
