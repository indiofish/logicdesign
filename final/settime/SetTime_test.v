`include "./SetTime.v"

module SetTime_test;
wire [3:0] h1, h0, min1, min0;
reg start, reset, nextDigit, up;

SetTime uut(
  h1,h0,min1,min0,start,reset,nextDigit,up
);

initial begin
  start = 0;
  reset = 1;
  up = 0;
  $dumpfile("SetTime.vcd");
  $dumpvars(0,SetTime_test);
end 

initial begin
  #100
  begin
    reset <= 0;
    start <= 1;
  end
  #10 start = 0;
  #10 up = 1;
  #10 up = 1;
  #10 up = 0;
  #10 up = 1;
  #10 up = 0;
  #10 up = 1;
  #10 up = 0;
  #10 up = 1;
  #10 up = 0;
  #10 up = 1;
  #10 up = 0;
  #10 up = 0;
  #10 up = 1;
  #10 up = 0;
  #10 up = 1;
  #10 up = 0;
  #10 up = 1;
  #10 up = 0;
  #10 up = 1;
  #10 up = 0;
  #10 nextDigit = 1;
  #10 nextDigit = 0;
  #10 up = 1;
  #10 up = 1;
  #10 up = 0;
  #10 up = 1;
  #10 up = 0;
  #10 up = 1;
  #10 up = 0;
  #10 up = 1;
  #10 up = 0;
  #10 up = 1;
  #10 up = 0;
  #10 up = 0;
  #10 up = 1;
  #10 up = 0;
  #10 up = 1;
  #10 up = 0;
  #200 nextDigit = 1;
  #10 nextDigit = 0;
  #10 up = 1;
  #10 up = 1;
  #10 up = 0;
  #10 up = 1;
  #10 up = 0;
  #10 up = 1;
  #10 up = 0;
  #10 up = 1;
  #10 up = 0;
  #10 up = 1;
  #10 up = 0;
  #10 up = 1;
  #10 up = 0;
  #10 up = 1;
  #10 up = 0;
  #10 up = 1;
  #10 up = 0;
  #10 up = 1;
  #10 up = 0;
  #10 up = 1;
  #10 up = 0;
  #10 up = 0;
  #10 up = 1;
  #10 up = 0;
  #10 up = 1;
  #10 up = 0;
  #10 up = 1;
  #10 up = 0;
  #10 up = 1;
  #10 up = 0;
  #10 up = 1;
  #10 up = 0;
  #10 up = 1;
  #10 up = 0;
  #10 up = 1;
  #10 up = 0;
  #200 nextDigit = 1;
  #10 nextDigit = 0;
  #10 up = 1;
  #10 up = 0;
  #10 up = 1;
  #10 up = 0;
  #10 up = 1;
  #10 up = 0;
  #10 up = 1;
  #10 up = 0;
  #10 up = 1;
  #10 up = 0;

  #3000 $finish;
end 

endmodule
