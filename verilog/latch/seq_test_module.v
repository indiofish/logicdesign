module seq_test_module (data, clk, reset, q);
  input data, clk, reset;
  output q;
  reg q;

  always @ (posedge clk)
  begin
    if(reset == 1)
      q <= 0;
    else
      q <= data;
  end
endmodule
