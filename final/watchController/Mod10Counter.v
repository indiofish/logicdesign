`ifndef MOD10_V
`define MOD10_V
module Mod10Counter(
  output reg[3:0] number,
  output reg cout,
  input[3:0] init,
  input start_resume,reset, stop, clk, set
);

reg [3:0] current, next;

parameter zero =4'b0000,
  one=4'b0001,
  two=4'b0010,
  three=4'b0011,
  four=4'b0100,
  five=4'b0101,
  six=4'b0110,
  seven=4'b0111,
  eight=4'b1000,
  nine=4'b1001;

always @(current or start_resume or reset or stop) 
begin
  if(start_resume==1 && current != nine)
  begin
    if  (current == zero)
    begin
      cout = 1;
    end
    else
    begin
      cout = 0;
    end
    next=current + 1;
    number=current;
  end
  else if(start_resume==0)
  begin
    cout = 0;
    next=current;
    number=current;
  end
  else if(stop==1)
  begin
    cout = 0;
    next=current;
    number=current;
  end
  else if(reset==1) 
  begin
    cout = 0;
    next=zero;
    number=current;
  end

  //change this to for counter of different modulo
  if(current == nine)
  begin
    next = zero;
    cout = 0;
    number = current;
  end

end

always @(posedge clk)
begin
  begin
    if (set == 1)
      current <= init;
    else if(reset==1)
      current <= zero;
    else
      current <= next;
  end
end
endmodule
`endif
