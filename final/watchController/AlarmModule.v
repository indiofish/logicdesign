//TODO get input from SetTime
module AlarmModule (
  output reg alarm,
  output reg[3:0] disH1,disH0,disM1,disM0,//for display
  input[3:0] curHour1, curHour0, curMin1, curMin0, //read time every n's clk
  input alarmSet, alarmReset, clk
);

reg[3:0] savMin0, savMin1, savHour0, savHour1; //save alarm time

//if curMin0 changes, everything changes
always @(curMin0)
begin
  if  (
    savMin0 == curMin0   &&
    savMin1 == curMin1   &&
    savHour0 == curHour0 &&
    savHour1 == curHour1 &&
    alarmSet != 1
  ) 
  begin
    alarm = 1;
  end
  else 
  begin
    alarm = 0;
  end 
end

always @(posedge clk)
begin
  begin
    if(alarmReset==1)
    begin
      savMin0 <= 0;
      savMin1 <= 0;
      savHour0 <= 0;
      savHour1 <= 0;
    end 
    else if(alarmSet == 1)
    begin
      savMin0 <= curMin0;
      savMin1 <= curMin1;
      savHour0 <= curHour0;
      savHour1 <= curHour1;
    end 
    else 
    begin
      disM0<=savMin0;
      disM1<=savMin1;
      disH0<=savHour0;
      disH1<=savHour1;
    end
  end
end


endmodule
