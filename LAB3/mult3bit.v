module mult3bit (
    input [2:0] num1,      // İlk 3 bitlik sayı
    input [2:0] num2,      // İkinci 3 bitlik sayı
    output [5:0] result    // Çarpım sonucu (6 bit)
);

    wire [2:0] partial1, partial2, partial3;  // Ara sonuçlar
    wire carry1, carry2, carry3, carry4;      // Taşıma bitleri

    // num1[0] * num2[0], num1[1] * num2[0], num1[2] * num2[0]
    and (partial1[0], num1[0], num2[0]);
    and (partial1[1], num1[1], num2[0]);
    and (partial1[2], num1[2], num2[0]);

    // num1[0] * num2[1], num1[1] * num2[1], num1[2] * num2[1]
    and (partial2[0], num1[0], num2[1]);
    and (partial2[1], num1[1], num2[1]);
    and (partial2[2], num1[2], num2[1]);

    // num1[0] * num2[2], num1[1] * num2[2], num1[2] * num2[2]
    and (partial3[0], num1[0], num2[2]);
    and (partial3[1], num1[1], num2[2]);
    and (partial3[2], num1[2], num2[2]);

    // İlk toplama işlemi
    fullAdder fa1 (
        .A(partial1[0]),
        .B(partial2[0]),
        .Cin(0),
        .S(result[0]),
        .Cout(carry1)
    );

    // İkinci toplama işlemi
    fullAdder fa2 (
        .A(partial1[1]),
        .B(partial2[1]),
        .Cin(carry1),
        .S(result[1]),
        .Cout(carry2)
    );

    // Üçüncü toplama işlemi
    fullAdder fa3 (
        .A(partial1[2]),
        .B(partial2[2]),
        .Cin(carry2),
        .S(result[2]),
        .Cout(carry3)
    );

    // Dördüncü toplama işlemi
    fullAdder fa4 (
        .A(0),
        .B(partial3[0]),
        .Cin(carry3),
        .S(result[3]),
        .Cout(carry4)
    );

    // Beşinci toplama işlemi
    fullAdder fa5 (
        .A(0),
        .B(partial3[1]),
        .Cin(carry4),
        .S(result[4]),
        .Cout(carry1)  // Yeni taşıma bitini tekrar kullan
    );

    // Son toplama işlemi
    fullAdder fa6 (
        .A(0),
        .B(partial3[2]),
        .Cin(carry1),
        .S(result[5]),
        .Cout()  // Sonuçta taşıma bitine gerek yok
    );

endmodule
