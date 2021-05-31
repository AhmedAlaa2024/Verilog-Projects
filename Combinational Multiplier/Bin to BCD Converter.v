module Bin_to_BCD_converter(H, T, O, bin);
   output reg [3:0] H;
   output reg [3:0] T;
   output reg [3:0] O;
   input      [7:0] bin;

   integer i;
   always @ (bin)
   begin
      
      H = 4'b0000;
      T = 4'b0000;
      O = 4'b0000;

      for (i=7; i>=0; i=i-1)
      begin
	   // Add 3
	   if (H > 4)
		H = H + 3;
	   if (T > 4)
		T = T + 3;
	   if (O > 4)
		O = O + 3;

	   // Shift left 1
	   H = H << 1;
	   H[0] = T[3];
	   T = T << 1;
	   T[0] = O[3];
           O = O << 1;
	   O[0] = bin[i];
       end
   end

endmodule