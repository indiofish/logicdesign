`include "./shiftRg_3bit.v"
module shiftRgtest ;
  reg Data;
  reg clk;
  wire [2:0]out;

  shiftRg_3bit uut (
    .Data(Data),
    .clk(clk),
    .Result(out)
  );

  initial begin 
    Data = 1;
    clk = 0;
    $dumpfile("wave.vcd");
    $dumpvars(0,shiftRgtest);

    forever begin
      #10 clk = ~clk;
    end
  end

  initial begin
      //#30 Data = 1;
      //#30 data = 1;
      //#90 data = 0;
      #420 $finish;
    end 
  initial begin
    $monitor("time = ", $time, "data is %b, output is %b"
    ,Data, out);
  end
  
  
endmodule
