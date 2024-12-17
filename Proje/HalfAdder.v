module HalfAdder (
    input A,
    input B,
    output Sum,
    output Carry
);

and a1 (Carry, A, B);  // Carry = A AND B
xor xo1 (Sum, A, B);   // Sum = A XOR B

endmodule
