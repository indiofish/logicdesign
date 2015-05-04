`include "./counter_3bit.v"
module countertest ;
reg [2:0]in;
reg clk;
wire [2:0] out;

counter_3bit uut (
  .in(in),
  .clk(clk),
  .Result(out)
);
  
  initial begin 
    in[0] = 0;
    in[1] = 0;
    in[2] = 0;
    clk = 0;
    $dumpfile("wave.vcd");
    $dumpvars(0,countertest);

    forever begin
      #5 clk = ~clk;
    end
  end

  initial begin
    repeat (2**3) begin
    #30 {in[0], in[1], in[2]}
    = {(out[0]^1'b1), out[0] ^ out[1],(out[0] & out[1]) ^ out[2] };
  end
      #10000 $finish;
    end 
  initial begin
    $monitor("time = ", $time, " output is %b"
    , out);
  end
endmodule
