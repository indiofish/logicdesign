module vending (
  output drink,
  input coin5, coin10, reset, clk
);

reg [1:0] cst, nst;
reg drink;

parameter hasCoin0 = 2'b00,
  hasCoin5 = 2'b01,
  hasCoin10 = 2'b10,
  hasCoin15 = 2'b11;

always @(cst or coin5 or coin10)
begin
  case (cst)
    hasCoin0: 
      if(coin5 == 1'b1 && coin10 == 1'b0)
      begin
        nst = hasCoin5;
        drink = 1'b0;
      end
      else if(coin5 == 1'b0 && coin10 == 1'b1)
      begin
        nst = hasCoin10;
        drink = 1'b0;
      end
      else if(coin5 == 1'b1 && coin10 == 1'b1)
      begin
        nst = hasCoin15;
        drink = 1'b0;
      end
      else //coin5 = 0, coin10 = 0
      begin
        nst = hasCoin0;
        drink = 1'b0;
      end

    hasCoin5:
      if(coin5 == 1'b1 && coin10 == 1'b0)
      begin
        nst = hasCoin10;
        drink = 1'b0;
      end
      else if(coin5 == 1'b0 && coin10 == 1'b1)
      begin
        nst = hasCoin15;
        drink = 1'b0;
      end
      else if(coin5 == 1'b1 && coin10 == 1'b1)
      begin
        //don't cares
      end
      else
      begin
        nst = hasCoin0;
        drink = 1'b0;
      end

    hasCoin10:
      if(coin5 == 1'b1 && coin10 == 1'b0)
      begin
        nst = hasCoin15;
        drink = 1'b0;
      end
      else if(coin5 == 1'b0 && coin10 == 1'b1)
      begin
        nst = hasCoin15;
        drink = 1'b0;
      end
      else if(coin5 == 1'b1 && coin10 == 1'b1)
      begin
        //don't cares
      end
      else
      begin
        nst = hasCoin10;
        drink = 1'b0;
      end
    hasCoin15:
    begin
      nst = hasCoin0;
      drink = 1'b1;
    end
    default: nst = hasCoin0;
  endcase
end

always @ (posedge clk)
begin
  begin
    if(reset)
      cst <= hasCoin0;
    else
      cst <= nst;
  end
end

endmodule
