module addition (
    input [3:0] A, B,         // 4 bitlik girişler A ve B
    input CarryIN,            // Carry girişini alır
    output [3:0] Y,           // 4 bitlik toplama sonucu
    output CarryOUT,          // Taşıma çıkışı
    output overflow           // Taşma durumu (overflow)
);

// Ara taşıma bitlerini tutacak wire'lar
wire [3:0] Carry4;

// Full Adder'ları kullanarak toplama işlemi yapıyoruz
// İlk full adder, A[0] ve B[0] ile başlar, CarryIN girişini de alır.
FullAdder F0 (
   .A(A[0]),
   .B(B[0]),
   .CarryIn(CarryIN),   // CarryIN olarak bağlamalısınız
   .Sum(Y[0]), 
   .CarryO(Carry4[0])   // CarryO olarak bağlamalısınız
);

FullAdder F1 (
   .A(A[1]), 
   .B(B[1]), 
   .CarryIn(Carry4[0]), // Carry4[0] değerini CarryIn olarak bağlayın
   .Sum(Y[1]), 
   .CarryO(Carry4[1])   // Carry4[1] değerini CarryO olarak bağlayın
);

FullAdder F2 (
   .A(A[2]), 
   .B(B[2]), 
   .CarryIn(Carry4[1]), // Carry4[1] değerini CarryIn olarak bağlayın
   .Sum(Y[2]), 
   .CarryO(Carry4[2])   // Carry4[2] değerini CarryO olarak bağlayın
);

FullAdder F3 (
   .A(A[3]), 
   .B(B[3]), 
   .CarryIn(Carry4[2]), // Carry4[2] değerini CarryIn olarak bağlayın
   .Sum(Y[3]), 
   .CarryO(CarryOUT)    // CarryOUT olarak bağlayın
);

endmodule

