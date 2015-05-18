`include "seqDetector111.v"

module seqDetector111_test;
reg din, clk, reset;
wire out;

seqDetector111 uut(out, din,clk,reset);

initial begin
  din = 0; 
  reset = 1;
  clk = 0;
  $dumpfile("seq.vcd");
  $dumpvars(0,seqDetector111_test);
  forever begin
    #10 clk = ~clk;
  end 
end 

initial begin
  #20 reset = 0;
  #20 din = 0;
  #20 din = 1;
  #80 din = 0;
  #20 din = 0;
  #20 din = 0;
  #20 din = 0;
  #20 din = 0;

  //#30 reset = 1;
  #50 $finish;
end 

initial begin
  $monitor ($time,"clk: %b ",clk, "input: %b", din, " output: %b", out);
end

endmodule
