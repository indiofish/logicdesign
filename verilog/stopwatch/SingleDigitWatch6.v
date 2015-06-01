module SingleDigitWatch6(
  //output cout,
  output[3:0] number,
  input start_resume,reset, stop, clk
);

//reg cout;
reg [3:0] current, next;
reg [3:0] number;

parameter zero =4'b0000,
  one=4'b0001,
  two=4'b0010,
  three=4'b0011,
  four=4'b0100,
  five=4'b0101;

always @(current or start_resume or reset or stop) 
begin
  case (current)
    zero: if(start_resume==1) 
    begin
      next=one;
      number=current;
    end
    else if(start_resume==0)
    begin
      next=zero;
      number=current;
    end
    else if(stop==1)
    begin
      next=zero;
      number=current;
    end
    else if(reset==1)
    begin
      next=zero;
      number=4'b0000;
    end

    one: if(start_resume == 1)
    begin
      next = two;
      number = current;
    end
    else if(start_resume==0)
    begin
      next=current;
      number=current;
    end
    else if(stop==1)
    begin
      next=zero;
      number=current;
    end
    else if(reset==1) 
    begin
      next=zero;
      number=4'b0000;
    end

    two: if(start_resume==1)
    begin
      next=three;
      number=current;
    end
    else if(start_resume==0)
    begin
      next=current;
      number=current;
    end
    else if(stop==1)
    begin
      next=current;
      number=current;
    end
    else if(reset==1)
    begin
      next=zero;
      number=4'b0000;
    end

    three: if(start_resume==1)
    begin
      next=four;
      number=current;
    end
    else if(start_resume==0)
    begin
      next=current;
      number=4'b011;
    end
    else if(stop==1)
    begin
      next=current;
      number=current;
    end
    else if(reset==1)
    begin
      next=zero;
      number=current;
    end

    four: if(start_resume==1)
    begin
      next=five;
      number=current;
    end
    else if(start_resume==0)
    begin
      next=current;
      number=current;
    end
    else if(stop==1)
    begin
      next=current;
      number=current;
    end
    else if(reset==1)
    begin
      next=zero;
      number=current;
    end

    five: if(start_resume==1)
    begin
      next=zero;
      number=current;
      //cout = 1;
    end
    else if(start_resume==0)
    begin
      next=current;
      number=current;
    end
    else if(stop==1)
    begin
      next=current;
      number=current;
    end
    else if(reset==1)
    begin
      next=zero;
      number=current;
    end

    default: number = 4'b0000;
  endcase
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
