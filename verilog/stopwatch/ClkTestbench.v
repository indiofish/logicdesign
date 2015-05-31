`include "./ClkTest.v"

module ClkTestbench;
wire newclk;
reg clk;

ClkTest uut(newclk,clk);

initial begin
  //start_resume = 0;
  //reset = 1;
  clk = 0;
  $dumpfile("test.vcd");
  $dumpvars(0,ClkTestbench);
  forever begin
    #1 clk = ~clk;
  end 
end 

initial begin
  #1000 $finish;
end 

initial begin
  $monitor ($time, "  output : %b", newclk);
end

endmodule
