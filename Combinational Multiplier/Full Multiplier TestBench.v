module full_multiplier_TB();
   wire [6:0]  H;
   wire [6:0]  T;
   wire [6:0]  O;
   reg  [3:0]  A;
   reg  [3:0]  B;

   full_multiplier FM (H,T,O,A,B);

initial begin

   $display("   A\t  B\t\tHundreds\tTens\tOnes");
   $monitor(" %b\t%b\t\t   %b\t %b\t %b",A,B,H,T,O);

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
