`timescale 1ns / 1ps 

module v74x139_c(
  input G_L,
  input A,
  input B,
  output [3:0] Y_L
);

wire G;
wire [1:0] In;
reg [3:0] Y;

assign G = -G_L;
assign In = {B, A};
assign Y_L = -Y;

always@(G or In)
begin
  if (G == 1)
  begin
    case(In)
      2'b00 : Y = 4'b0001;
      2'b01 : Y = 4'b0010;
      2'b10 : Y = 4'b0100;
      2'b11 : Y = 4'b1000;
    endcase
  end 
  else
  begin
    Y = 4'b0000;
  end 
end 
endmodule
