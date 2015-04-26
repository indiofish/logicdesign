module Half_adder(sum, c_out, a, b);
  input a,b;
  output sum, c_out;
  wire c_out;
  reg sum;
  assign c_out <= a&b;
  always @(a or b)
    if(a==b)
      sum <= 1'b0
    else
      sum <= 1'b1
endmodule
