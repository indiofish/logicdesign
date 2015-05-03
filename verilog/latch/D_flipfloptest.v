`include "./D_flipflop.v"

module D_flipfloptest ;
  reg data;
  reg clk;
  wire q, _q;

  D_flipflop uut (
    .data(data),
    .clk(clk),
    .Q(q),
    ._Q(_q)
  );
  
  initial begin 
    data = 0;
    clk = 0;
    $dumpfile("wave.vcd");
    $dumpvars(0,D_flipfloptest);
    forever begin
      #10 clk = ~clk;
    end
  end

  initial begin
      #60 data = 0;
      #80 data = 1;
      //#90 data = 0;
      #120 $finish;
    end 
  initial begin
    $monitor("time = ", $time, " data = %b q = %b _q = %b"
    ,data, q, _q);
  end

endmodule
