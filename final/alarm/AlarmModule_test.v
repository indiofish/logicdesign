`include "./AlarmModule.v"
//if we have to beep the alarm, synch it with clk
module AlarmModule_test;
wire alarm;
reg[3:0] curMin0, curMin1, curHour0, curHour1;
reg set,reset,clk;

AlarmModule uut(alarm,curMin0, curMin1, curHour0, curHour1
  ,set,reset,clk);


initial begin
  reset = 1;
  clk = 0;
  $dumpfile("alarm.vcd");
  $dumpvars(0,AlarmModule_test);
  forever begin
    #10 clk = ~clk;
  end 
end 

initial begin
  #100
  begin
    reset <= 0;
    set <= 1;
    curHour1 <= 0;
    curHour0 <= 9;
    curMin1 <= 2;
    curMin0 <= 5; //09 : 25
  end
  #50
  begin
    set = 0;
    curMin0 <= 0;
  end
  #20
  begin
    curMin0=curMin0+1;
  end
  #20
  begin
    curMin0=curMin0+1;
  end
  #20
  begin
    curMin0=curMin0+1;
  end
  #20
  begin
    curMin0=curMin0+1;
  end
  #20
  begin
    curMin0=curMin0+1;
  end
  #50
  begin
    curMin0 = curMin0 + 1;
  end
  #200 $finish;
end 

initial begin
  $monitor ($time, "  min0 : %b alarm: %b", curMin0,alarm);
end
  
endmodule
