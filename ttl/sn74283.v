/****************************************************************************
 *                                                                          *
 *  VERILOG HIGH-LEVEL DESCRIPTION OF THE TI 74283 CIRCUIT                  *
 *                                                                          *
 *  Function: Four-bit Fast Adder                                           *
 *                                                                          *
 *  Written by: Mark C. Hansen                                              *
 *                                                                          *
 *  Last modified: Dec 12, 1997                                             *
 *                                                                          *
 ****************************************************************************/

module Circuit74283 (C0, A, B, S, C4);

  input[3:0]    A, B;
  input	        C0;

  output[3:0]   S;
  output        C4;
	
  TopLevel74283 Ckt74283 (C0, A, B, S, C4);

endmodule /* Circuit74283 */

/*************************************************************************/

module TopLevel74283 (C0, A, B, S, C4);

  input[3:0]    A, B;
  input	        C0;
  output[3:0]   S;
  output        C4;
  wire[3:0]     GB, PB, AxB;
  wire[3:0]     C;

  GP_Module GP_Mod1(A, B, GB, PB, AxB);
  CLA_Module CLA_Mod2(GB, PB, C0, C, C4);
  Sum_Module Sum_Mod3(AxB, C, S);  

endmodule /* TopLevel74182 */

/*************************************************************************/

module GP_Module(A, B, GB, PB, AxB);
  input[3:0]    A, B;
  output[3:0]   GB, PB, AxB;
  wire[3:0]     P;

  nor PBgate0(PB[0], A[0], B[0]);
  nand GBgate0(GB[0], A[0], B[0]);
  not Pgate0(P[0], PB[0]);
  and AxBgate0(AxB[0], GB[0], P[0]);

  nor PBgate1(PB[1], A[1], B[1]);
  nand GBgate1(GB[1], A[1], B[1]);
  not Pgate1(P[1], PB[1]);
  and AxBgate1(AxB[1], GB[1], P[1]);

  nor PBgate2(PB[2], A[2], B[2]);
  nand GBgate2(GB[2], A[2], B[2]);
  not Pgate2(P[2], PB[2]);
  and AxBgate2(AxB[2], GB[2], P[2]);

  nor PBgate3(PB[3], A[3], B[3]);
  nand GBgate3(GB[3], A[3], B[3]);
  not Pgate3(P[3], PB[3]);
  and AxBgate3(AxB[3], GB[3], P[3]);

endmodule /* GP_Module */

/*************************************************************************/

module   CLA_Module(GB, PB, C0, C, C4);
input[3:0]      GB, PB;
input           C0;
output[3:0]     C;
output          C4;

  not C0Bgate(C0B, C0);
  not C0gate(C[0], C0B);

  buf PB0gate(PB0, PB[0]);
  and C0BGB0gate(C0BGB0, C0B, GB[0]);

  buf PB1gate(PB1, PB[1]);
  and PB0GB1gate(PB0GB1, PB[0], GB[1]);
  and C0BGB01gate(C0BGB01, C0B, GB[0], GB[1]);

  buf PB2gate(PB2, PB[2]);
  and PB1GB2gate(PB1GB2, PB[1], GB[2]);
  and PB0GB12gate(PB0GB12, PB[0], GB[1], GB[2]);
  and C0BGB012gate(C0BGB012, C0B, GB[0], GB[1], GB[2]);

  buf PB3gate(PB3, PB[3]);
  and PB2GB3gate(PB2GB3, PB[2], GB[3]);
  and PB1GB23gate(PB1GB23, PB[1], GB[2], GB[3]);
  and PB0GB123gate(PB0GB123, PB[0], GB[1], GB[2], GB[3]);
  and C0BGB0123gate(C0BGB0123, C0B, GB[0], GB[1], GB[2], GB[3]);

  nor C4gate(C4,PB3,PB2GB3,PB1GB23,PB0GB123,C0BGB0123);

  nor C3gate(C[3],PB2,PB1GB2,PB0GB12,C0BGB012);

  nor C2gate(C[2],PB1,PB0GB1,C0BGB01);

  nor C1gate(C[1],PB0,C0BGB0);


endmodule /* CLA_Module */

/*************************************************************************/

module   Sum_Module(AxB, C, S);
  input[3:0]      AxB;
  input[3:0]      C;
  output[3:0]     S;

  xor Sum0(S[0], C[0], AxB[0]);
  xor Sum1(S[1], C[1], AxB[1]);
  xor Sum2(S[2], C[2], AxB[2]);
  xor Sum3(S[3], C[3], AxB[3]);

endmodule /* Sum_Module */
