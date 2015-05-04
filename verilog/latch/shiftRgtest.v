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
    Data = 0;
    clk = 0;
    $dumpfile("wave.vcd");
    $dumpvars(0,shiftRgtest);

    forever begin
      #5 clk = ~clk;
    end
  end

  initial begin
      #30 Data = 0;
      #10 Data = 1;
      #10 Data = 0;
      #10 Data = 0;
      #10 Data = 1;
      #10 Data = 1;
      #10 Data = 0;
      #10 Data = 0;
      #600 $finish;
    end 
  initial begin
    $monitor("time = ", $time, " output is %b"
    , out);
  end
  
  
endmodule
