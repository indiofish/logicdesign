module D_latch_2 (dout, din, le);
  output dout;
  input din, le;
  reg dout;
  always @(din or le)
    if  (le == 1'b1)
      dout <= din; 
endmodule //latch
