module seven_segment_decoder_TB();
   wire [6:0] out;
   reg  [3:0] in;

   seven_segment_decoder SSD (out, in);
initial begin

   $display("  BCD\t\t  SSD");
   $monitor(" %b\t\t%b",in,out);
   
   in = 4'b0000;
   #10

   in = 4'b0001;
   #10

   in = 4'b0010;
   #10

   in = 4'b0011;
   #10

   in = 4'b0100;
   #10

   in = 4'b0101;
   #10

   in = 4'b0110;
   #10

   in = 4'b0111;
   #10

   in = 4'b1000;
   #10

   in = 4'b1001;
   #10 $finish;

end
endmodule