`ifndef MOD13_V
`define MOD13_V
//since modulo is expensive(is it?)
//do it manually
//first digit of hour display
//should have 24/12 mode input?????
module Mod13Counter(
  output reg[3:0] number,
  output reg cout,
  input start_resume,reset, stop, clk
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
  nine=4'b1001,
  ten=4'b1010,
  eleven = 4'b1011,
  twelve = 4'b1100;
  

always @(current or start_resume or reset or stop) 
begin
  if(start_resume==1 && current != twelve)
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
	if(current == ten)
		number = zero;
	else if(current == eleven)
		number = one;
	else if(current == twelve)
		number = two;
	else
		number = current;
  end
  else if(start_resume==0)
  begin
    cout = 0;
    next=current;
    if(current == ten)
		number = zero;
	else if(current == eleven)
		number = one;
	else if(current == twelve)
		number = two;
	else
		number = current;
  end
  else if(stop==1)
  begin
    cout = 0;
    next=current;
    if(current == ten)
		number = zero;
	else if(current == eleven)
		number = one;
	else if(current == twelve)
		number = two;
	else
		number = current;
  end
  else if(reset==1) 
  begin
    cout = 0;
    next=zero;
    if(current == ten)
		number = zero;
	else if(current == eleven)
		number = one;
	else if(current == twelve)
		number = two;
	else
		number = current;
  end

  //change this to for counter of different modulo
  if(current == twelve)
  begin
    next = zero;
    cout = 0;
    if(current == ten)
		number = zero;
	else if(current == eleven)
		number = one;
	else if(current == twelve)
		number = two;
	else
		number = current;
  end

end

always @(posedge clk)
begin
  begin
    if(reset==1)
      current <= zero;
    else
      current <= next;
  end
end
endmodule
`endif
