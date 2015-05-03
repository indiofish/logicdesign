`include "D_latch3.v"

module latchtest ;
  reg data;
  reg en;
  reg reset;
  wire q;

  D_latch3 uut (
    .data(data),
    .en(en),
    .reset(reset),
    .q(q)
  );

  initial begin 
    data = 0;
    en = 0;
    $dumpfile("wave.vcd");
    $dumpvars(0,latchtest);
    forever begin
      #10 en = ~en;
    end
  end

  initial begin
      #60 data = 0;
      #80 data = 1;
      #90 data = 1;
      #95 reset = 1;
      #100 reset = 0;
      #120 $finish;
    end 

  initial begin
    $monitor("time = ", $time, " q = %b",q);
  end

  endmodule
