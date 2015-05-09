module seqDetector111 (
  output out,
  input data, clk, reset
);

//Internal Variables
reg [1:0] cst, nst;
reg out;

parameter S0 = 2'b00,
  S1 = 2'b01,
  S2 = 2'b10,
  S3 = 2'b11; //after this, if 1 comes, out = 1

always @(cst or data)
begin
  case (cst)
    S0: if(data == 1'b1)
    begin
      nst = S1;
      out = 1'b0;
    end 
    else
    begin
      nst = S0;
      out = 1'b0;
    end 

    S1: if(data == 1'b1)
    begin
      nst = S3;
      out = 1'b0;
    end 
    else //data = 0;
    begin
      nst = S2;
      out = 1'b0;
    end 
    
    S2: if(data == 1'b1)
    begin
      nst = S1;
      out = 1'b0;
    end 
    else
    begin
      nst = S0;
      out = 1'b0;
    end 

    S3: if(data == 1'b1)
    begin
      nst = S3;
      out = 1'b1;
    end
    else 
    begin
      nst = S2;
      out = 1'b0;
    end

  default: nst = S0;
endcase
end

always @ (posedge clk)
begin
  begin
    if(reset)
      cst <= S0;
    else 
      cst <= nst;
  end
end

endmodule
