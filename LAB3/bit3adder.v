module bit3adder(
   input [2:0] A,
   input [2:0] B,
   output [3:0] Sum
);

wire [2:0] Carry3;

halfAdder h1(.A(A[0]), .B(B[0]), .S(Sum[0]), .Cout(Carry3[0]));
fullAdder f1(.A(A[1]), .B(B[1]), .Cin(Carry3[0]), .S(Sum[1]), .Cout(Carry3[1]));
fullAdder f2(.A(A[2]), .B(B[2]), .Cin(Carry3[1]), .S(Sum[2]), .Cout(Sum[3]));



endmodule
