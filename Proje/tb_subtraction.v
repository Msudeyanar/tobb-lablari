module tb_subtraction;

    reg [3:0] A, B;
    reg CarryIN;
    wire [3:0] Y;
    wire CarryOUT, overflow;

    // Subtraction modülünü instantiate ediyoruz
    subtraction uut (
        .A(A),
        .B(B),
        .CarryIN(CarryIN),
        .Y(Y),
        .CarryOUT(CarryOUT),
        .overflow(overflow)
    );

    initial begin
        // VCD dosyasına yazmak için
        $dumpfile("subtraction_tb.vcd"); // VCD dosyasını oluşturur
        $dumpvars(0, tb_subtraction);    // Tüm değişkenleri kaydeder
        
        // Test senaryoları
        $monitor("A=%b, B=%b, CarryIN=%b | Y=%b, CarryOUT=%b, overflow=%b", A, B, CarryIN, Y, CarryOUT, overflow);
        
        A = 4'b0011; B = 4'b0001; CarryIN = 1'b0; #10; // 3 - 1
        A = 4'b0110; B = 4'b0011; CarryIN = 1'b0; #10; // 6 - 3
        A = 4'b1000; B = 4'b0001; CarryIN = 1'b0; #10; // 8 - 1
        A = 4'b0111; B = 4'b1111; CarryIN = 1'b0; #10; // 7 - (-1)
        
        $finish;
    end
endmodule

