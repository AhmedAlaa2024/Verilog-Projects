module Bin_to_BCD_converter_TB();
   wire [3:0] H;
   wire [3:0] T;
   wire [3:0] O;
   reg [7:0] bin;

   Bin_to_BCD_converter BTBC (H, T, O, bin);

initial begin

   $display("   Bin\t\tHundreds\tTens\tOnes");
   $monitor(" %b\t\t%b\t%b\t%b",bin,H,T,O);

   bin = 8'b00000000;
   #10

   bin = 8'b00000010;
   #10

   bin = 8'b00000011;
   #10

   bin = 8'b00000101;
   #10

   bin = 8'b00001000;
   #10

   bin = 8'b00001010;
   #10

   bin = 8'b00100000;
   #10

   bin = 8'b00110000;
   #10

   bin = 8'b01010000;
   #10

   bin = 8'b10000000;
   #10

   bin = 8'b10100000;
   #10

   bin = 8'b00010001;
   #10

   bin = 8'b00100010;
   #10

   bin = 8'b00110011;
   #10

   bin = 8'b01010101;
   #10

   bin = 8'b10001000;
   #10

   bin = 8'b10101010;
   #10

   bin = 8'b11001100;
   #10

   bin = 8'b11111111;
   #10 $finish;
end

endmodule