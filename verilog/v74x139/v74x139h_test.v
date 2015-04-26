`include "v74x139h_a.v"
module v74x139h_test;

reg G_L;
reg A;
reg B;

wire Y0_L;
wire Y1_L;
wire Y2_L;
wire Y3_L;

v74x139h_a uut (
  .G_L(G_L),
  .A(A),
  .B(B),
  .Y0_L(Y0_L),
  .Y1_L(Y1_L),
  .Y2_L(Y2_L),
  .Y3_L(Y3_L)
  );

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0,v74x139h_test);
    G_L = 0;
    A = 0;
    B = 0;

    #100;

    G_L = 0;
    A = 1;
    B = 0;

    #100 G_L = 0; A = 0; B = 1;

    #100 G_L = 0; A = 1; B = 1;
    #100 G_L = 0; A = 1; B = 0;

    #100;

    //$display("\tG_L, \tB, \tY3_L, ...");
    //$monitor("%d, \t%d, \t%d, \t%d, ..., G_L, B, A, Y3_L, ...");
    //#100
    //$finish;
  end
endmodule
