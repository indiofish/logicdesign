module SetDay(
  output[2:0]seg,
  input start, reset, up

);

reg [2:0]seg;
reg changeDay;

always @(posedge up or posedge reset)
begin
  begin
    if(reset==1)
    begin
      changeDay<=0;
      seg<=3'b000;
    end
    else  
    begin
      seg<=(seg+1)%7; 
    end
  end
end
always @(posedge start)
begin
  changeDay<=~changeDay;
end
endmodule

