module overflowDetect (
    input [1:0] opCode,    // İşlem kodu (örneğin, 2 bit)
    input [3:0] A, B,    // 4 bitlik girişler
    input [3:0] Y,         // 4 bitlik sonuç
    input CarryOUT,        // Carry çıkışı
    output overflowDetect  // Taşma tespiti çıkışı
);

    wire signed [3:0] signedA = A;  // A'yı signed türde al
    wire signed [3:0] signedB = B;  // B'yi signed türde al
    wire signed [3:0] signedY = Y;  // Y'yi signed türde al

    // Overflow durumunu kontrol et
    assign overflowDetect = (opCode == 2'b10) && ((signedA + signedB) < signedY);

endmodule
