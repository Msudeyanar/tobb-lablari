module mult2bit (
    input [1:0] num1,       // İlk 2 bitlik sayı
    input [1:0] num2,       // İkinci 2 bitlik sayı
    output [3:0] result     // Çarpım sonucu (4 bit)
);

    wire [1:0] partial1, partial2;  // Ara sonuçlar
    wire carry1, carry2;            // Taşıma bitleri

    // num1[0] * num2[0] ve num1[1] * num2[0] için AND işlemleri
    and (partial1[0], num1[0], num2[0]);
    and (partial1[1], num1[1], num2[0]);

    // num1[0] * num2[1] ve num1[1] * num2[1] için AND işlemleri
    and (partial2[0], num1[0], num2[1]);
    and (partial2[1], num1[1], num2[1]);

    // İki bitlik çarpımların toplama işlemleri için Half Adder ve Full Adder kullanma
    halfAdder ha1 (
        .A(partial1[0]), 
        .B(partial2[0]), 
        .S(result[0]), 
        .Cout(carry1)   // Carry1 çıkışı
    );

    fullAdder fa1 (
        .A(partial1[1]), 
        .B(partial2[1]), 
        .Cin(carry1),   // Carry1 giriş olarak kullanılır
        .S(result[1]), 
        .Cout(carry2)   // Carry2 çıkışı
    );

    fullAdder fa2 (
        .A(0),           // Sabit 0 kullanıyoruz çünkü bu bitler zaten sıfır olacak
        .B(0),           // Sabit 0 kullanıyoruz çünkü bu bitler zaten sıfır olacak
        .Cin(carry2),    // Carry2 giriş olarak kullanılır
        .S(result[2]), 
        .Cout(result[3]) // Sonuç için taşıma bitini atıyoruz
    );

endmodule
