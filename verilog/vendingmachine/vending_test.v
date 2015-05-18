`include "vending.v"

module vending_test;
reg coin5, coin10, reset, clk;
wire drink;

vending m(drink, coin5, coin10,reset,clk);

initial begin
  coin5 = 0;
  coin10 = 0;
  reset = 1;
  clk = 0;
  $dumpfile("vending.vcd");
  $dumpvars(0,vending_test);
  forever begin
    #10 clk = ~clk;
  end 
end

initial begin
  #20 reset = 0;
  #20 coin5 = 0; coin10 = 1;
  #20 coin5 = 1; coin10 = 0;
  #20 coin5 = 0; coin10 = 0;
  #20 coin5 = 1; coin10 = 1;
  #20 coin5 = 0; coin10 = 0;
  #5 coin5 = 0; coin10 = 0;
  #10 coin5 = 1; coin10 = 0;
  #70 coin5 = 0; coin10 = 0;

  #100 $finish;
end

initial begin
  $monitor ($time," coin5: %b ",coin5, "coin10: %b ", coin10, " drink: %b", drink);
end
  
endmodule
