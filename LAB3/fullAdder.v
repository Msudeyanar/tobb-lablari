module fullAdder (
    input A, B, Cin,        // Girişler
    output S, Cout          // Çıkışlar
);

    wire AxB, AnB, AnB1, AnB2;  // Ara sinyaller

    // İlk Half Adder (A + B)
    halfAdder h0 (
        .A(A),
        .B(B),
        .S(AxB),
        .Cout(AnB2)
    );

    // İkinci Half Adder (AxB + Cin)
    halfAdder h1 (
        .A(AxB),
        .B(Cin),
        .S(S),
        .Cout(AnB1)
    );

    // Taşıma çıkışı
    or(Cout, AnB1, AnB2);  // Taşıma çıkışı
endmodule
