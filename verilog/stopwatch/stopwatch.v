module stopwatch(
  output[3:0] number,
  input start_resume,reset, stop, clk
);

reg [3:0] current, next;
reg [3:0] number;

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
  case (current)
    zero: if(start_resume==1) 
    begin
      next=one;
      number=4'b0001;
    end
    else if(start_resume==0)
    begin
      next=zero;
      number=4'b0000;
    end
    else if(stop==1)
    begin
      next=zero;
      number=4'b0000;
    end
    else if(reset==1)
    begin
      next=zero;
      number=4'b0000;
    end

    one: if(start_resume == 1)
    begin
      next = two;
      number = 4'b0010;
    end
    else if(start_resume==0)
    begin
      next=current;
      number=4'b0001;
    end
    else if(stop==1)
    begin
      next=zero;
      number=4'b0000;
    end
    else if(reset==1) 
    begin
      next=zero;
      number=4'b0000;
    end

    two: if(start_resume==1)
    begin
      next=three;
      number=4'b0011;
    end
    else if(start_resume==0)
    begin
      next=current;
      number=4'b0010;
    end
    else if(stop==1)
    begin
      next=current;
      number=4'b0010;
    end
    else if(reset==1)
    begin
      next=zero;
      number=4'b0000;
    end

    three: if(start_resume==1)
    begin
      next=four;
      number=4'b0100;
    end
    else if(start_resume==0)
    begin
      next=current;
      number=4'b011;
    end
    else if(stop==1)
    begin
      next=current;
      number=4'b0011;
    end
    else if(reset==1)
    begin
      next=zero;
      number=4'b0000;
    end

    four: if(start_resume==1)
    begin
      next=five;
      number=4'b0101;
    end
    else if(start_resume==0)
    begin
      next=current;
      number=4'b0100;
    end
    else if(stop==1)
    begin
      next=current;
      number=4'b0100;
    end
    else if(reset==1)
    begin
      next=zero;
      number=4'b0000;
    end

    five: if(start_resume==1)
    begin
      next=six;
      number=4'b0110;
    end
    else if(start_resume==0)
    begin
      next=current;
      number=4'b0101;
    end
    else if(stop==1)
    begin
      next=current;
      number=4'b0101;
    end
    else if(reset==1)
    begin
      next=zero;
      number=4'b0000;
    end

    six: if(start_resume==1)
    begin
      next=seven;
      number=4'b0111;
    end
    else if(start_resume==0)
    begin
      next=current;
      number=4'b0110;
    end
    else if(stop==1)
    begin
      next=current;
      number=4'b0110;
    end
    else if(reset==1) 
    begin
      next=zero;
      number=4'b0000;
    end

    seven: if(start_resume==1)
    begin
      next=eight;
      number=4'b1000;
    end
    else if(start_resume==0)
    begin
      next=current;
      number=4'b0111;
    end
    else if(stop==1)
    begin
      next=current;
      number=4'b0111;
    end
    else if(reset==1) 
    begin
      next=zero;
      number=4'b0000;
    end

    eight: if(start_resume==1)
    begin
      next=nine;
      number=4'b1001;
    end
    else if(start_resume==0)
    begin
      next=current;
      number=4'b1000;
    end
    else if(stop==1)
    begin
      next=current;
      number=4'b1000;
    end
    else if(reset==1) 
    begin
      next=zero;
      number=4'b0000;
    end

    nine: if(start_resume==1)
    begin
      next=zero;
      number=4'b0000;
    end
    else if(start_resume==0)
    begin
      next=current;
      number=4'b1001;
    end
    else if(stop==1)
    begin
      next=current;
      number=4'b1001;
    end
    else if(reset==1) 
    begin
      next=zero;
      number=4'b0000;
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
