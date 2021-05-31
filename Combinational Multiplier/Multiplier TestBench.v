module multiplier_TB();
   wire [7:0] out;
   reg  [3:0] A;
   reg  [3:0] B;

   multiplier M (out,A,B);

initial begin
   
   $display("   A\t  B\t\tOut");
   $monitor(" %b\t%b\t\t %b",A,B,out);

   A = 4'b0000; B = 4'b0000;
   #10
   
   A = 4'b0001; B = 4'b0001;
   #10

   A = 4'b0010; B = 4'b0001;
   #10
   
   A = 4'b0011; B = 4'b0001;
   #10

   A = 4'b0011; B = 4'b0011;
   #10
   
   A = 4'b0111; B = 4'b0001;
   #10

   A = 4'b0111; B = 4'b0000;
   #10

   A = 4'b0111; B = 4'b001;
   #10
   
   A = 4'b0111; B = 4'b0011;
   #10

   A = 4'b0111; B = 4'b0101;
   #10
   
   A = 4'b0111; B = 4'b0111;
   #10
   
   A = 4'b1111; B = 4'b0000;
   #10

   A = 4'b1111; B = 4'b1010;
   #10
   
   A = 4'b1111; B = 4'b0101;
   #10

   A = 4'b1111; B = 4'b1111;
   #10 $finish;
end

endmodule