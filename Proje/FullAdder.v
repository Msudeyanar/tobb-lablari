module FullAdder (
    input A,
    input B,
    input CarryIn,
    output Sum,
    output CarryO
);

wire sum1, and1, and2;

// İlk Half Adder (A + B)
HalfAdder HA1 (
    .A(A),
    .B(B),
    .Sum(sum1),
    .Carry(and1)
);

// İkinci Half Adder (sum1 + CarryIn)
HalfAdder HA2 (
    .A(sum1),
    .B(CarryIn),
    .Sum(Sum),
    .Carry(and2)
);

or o1 (CarryO, and1, and2);  // CarryOut = (A AND B) OR (sum1 AND CarryIn)

endmodule
