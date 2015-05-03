//-----------------------------------------------------
// Design Name : dlatch_reset
// File Name   : dlatch_reset.v
// Function    : DLATCH async reset
// Coder       : Deepak Kumar Tala
//-----------------------------------------------------
module D_latch3 (
output q, _q,
input data,en // LatchInput// Data Input 
//reset  , // Reset input
);

//------------Internal Variables--------
reg q;
reg _q;

//-------------Code Starts Here---------
always @ ( en or data)
if (en) begin
  q <= data;
  _q <= !q;
end

endmodule //End Of Module dlatch_reset
