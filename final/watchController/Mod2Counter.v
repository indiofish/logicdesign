`ifndef MOD2_V
`define MOD2_V
module Mod2Counter(
  output reg[3:0] number,
  output reg cout,
  input[3:0] init,
  input start_resume,reset, stop, clk, set
);

reg [3:0] current, next;

parameter zero =4'b0000,
  one=4'b0001;
  //two=4'b0010,

always @(current or start_resume or reset or stop) 
begin
  if(start_resume==1 && current != one)
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
  if(current == one)
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
