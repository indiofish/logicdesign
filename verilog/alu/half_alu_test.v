`include "./half_alu.v"
module half_alu_test;
reg [2:0] o;
reg a;
reg b;

wire c;

half_alu uut (
  .c(c),
  .a(a),
  .b(b),
  .o1(o[2]),
  .o2(o[1]),
  .o3(o[0])
);

initial begin 
  a = 0;
  b = 0;
  o = 0;
  $dumpfile("wave.vcd");
  $dumpvars(0,half_alu_test);
end
  initial begin
      #10 {a,b,o[2],o[1],o[0]}
      ={1'b1,1'b0,1'b0,1'b0,1'b0};
      #10 {a,b,o[2],o[1],o[0]}
      ={1'b1,1'b0,1'b0,1'b1,1'b0};
      #10 {a,b,o[2],o[1],o[0]}
      ={1'b0,1'b1,1'b0,1'b0,1'b1};
      #10 {a,b,o[2],o[1],o[0]}
      ={1'b1,1'b0,1'b1,1'b1,1'b1};
      #600 $finish;
    end 
  initial begin
    $monitor("time =", $time, " a is %b , b is %b, o1o2o3 is %b output is %b"
    ,a,b,o,c);
  end
endmodule
