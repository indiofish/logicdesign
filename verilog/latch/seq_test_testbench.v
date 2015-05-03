`include "seq_test_module.v"

module seq_test_testbench;
reg data;
reg clk;
reg reset;

wire q;

seq_test_module uut (
  .data(data),
  .clk(clk),
  .reset(reset),
  .q(q)
);

initial begin
  data = 0;
  clk = 0;
  reset = 0;
  $dumpfile("wave.vcd");
  $dumpvars(0,seq_test_testbench);
  forever begin
    #10 clk = ~clk;
  end
end 

initial begin
  #50 data = 1;
  #60 data = 0;
  #80 data = 1;
  #50 reset = 1;
  #90 reset = 0;
  #100 $finish;
end
initial begin
  $monitor("time = ", $time, " data=%b",data);
end

endmodule
