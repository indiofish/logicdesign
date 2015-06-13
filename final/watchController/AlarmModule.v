//TODO get input from SetTime
module AlarmModule (
  output alarm,
  //output[3:0] savH1,savH0,savM1,savM0,
  input[3:0] curHour1, curHour0, curMin1, curMin0, //read time every n's clk
  input alarmSet, alarmReset, clk
);
reg alarm;
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
    $display("BEEP!\ntime: %d%d%d%d",
      savHour1, savHour0, savMin1, savMin0);
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
  end
end


endmodule
