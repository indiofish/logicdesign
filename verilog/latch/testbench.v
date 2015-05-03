`include "D_latch.v"

module testbench;
//IN
reg D;
reg E;

//Out
wire Q;
wire _Q;

D_latch uut (
  .Q(Q),
  ._Q(_Q),
  .D(D),
  .E(E)
);

initial begin
  D = 0;
  E = 0;
  $dumpfile("wave.vcd");
  $dumpvars(0,testbench);

#100;
E = 0; D = 1;
#100;
E = 1; D = 1;
end

initial begin
  $monitor("time = ", $time, " Q=%b _Q=%b", Q, _Q);
end

endmodule
