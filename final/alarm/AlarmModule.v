module AlarmModule (
  output alarm,
  input[3:0] curMin0, curMin1, curHour0, curHour1, //read time every 10's clk
  input alarmSet, alarmReset, clk
);
reg alarm;
//reg curMin0, curMin1, curHour0, curHour1;
reg[3:0] savMin0, savMin1, savHour0, savHour1; //save alarm time

always @(curMin0) //if curMin0 changes, everything changes
begin
  if  (
    savMin0 == curMin0   &&
    savMin1 == curMin1   &&
    savHour0 == curHour0 &&
    savHour1 == curHour1 
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
  end
end

  
endmodule
