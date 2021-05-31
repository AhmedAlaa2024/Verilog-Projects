module full_multiplier(H,T,O,A,B);
   output [6:0]  H;
   output [6:0]  T;
   output [6:0]  O;
   input  [3:0]  A;
   input  [3:0]  B;

   wire   [7:0]  result;
   wire   [3:0]  H_;
   wire   [3:0]  T_;
   wire   [3:0]  O_;
  
   multiplier M (result,A,B);
   Bin_to_BCD_converter BTBC (H_, T_, O_, result);
   seven_segment_decoder SSD1 (O, O_);
   seven_segment_decoder SSD2 (T, T_);
   seven_segment_decoder SSD3 (H, H_);
endmodule