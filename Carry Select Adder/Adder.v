module carry_select_adder(S, Cout, A, B, Cin);
   output [15:0]  S;
   output        Cout;
   input  [15:0]  A;
   input  [15:0]  B;
   input         Cin;

   wire   [3:0]  temp1;
   wire   [3:0]  temp2;
   wire   [3:0]  temp3;
   wire   [3:0]  temp4;
   wire		 c1;
   wire          c2;
   wire		 c3;
   wire          c4;

   // For Carry in = 0
   assign {c1,temp1} = A[3:0] + B[3:0] + 0;
   assign {c2,temp2} = A[7:4] + B[7:4] + 0;
   assign {c3,temp3} = A[11:8] + B[11:8] + 0;
   assign {c4,temp4} = A[15:12] + B[15:12] + 0;

   // For Carry in = 1
   assign {c1,temp1} = A[3:0] + B[3:0] + 1;
   assign {c2,temp2} = A[7:4] + B[7:4] + 1;
   assign {c3,temp3} = A[11:8] + B[11:8] + 1;
   assign {c4,temp4} = A[15:12] + B[15:12] + 1;

   assign S[3:0] = (Cin == 0)?temp1:temp2;
   assign S[7:4] = (