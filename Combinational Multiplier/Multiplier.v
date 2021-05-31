module multiplier(out,A,B);
   output [7:0] out;
   input  [3:0] A;
   input  [3:0] B;

   assign out = A*B;
endmodule