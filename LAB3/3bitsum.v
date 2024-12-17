module moduleName (
   input [2:0] A,
   input [2:0] B,
   output [3:0] Sum
);

wire [2:0] Carry3;

halfadder h1(.A(A[0]), .B(B[0]), .Sum(Sum[0]), .CarryOut(Carry3[0]));
fulladder f1(.A(A[1]), .B(B[1]), .CarryIn(Carry3[0]), .Sum(Sum[1]), .CarryOut(Carry3[1]));
fulladder f2(.A(A[2]), .B(B[2]), .CarryIn(Carry3[1]), .Sum(Sum[2]), .CarryOut(Sum[3]));

endmodule
