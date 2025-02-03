module mult3bitTB;
    reg [2:0] num1, num2;    // 3 bitlik girişler
    wire [5:0] result;        // 6 bitlik çıkış

    // Mult3bit modülünü instantiation
    mult3bit uut (
        .num1(num1),
        .num2(num2),
        .result(result)
    );

    initial begin
        // Test için VCD dosyası oluşturuluyor
        $dumpfile("mult3bit.vcd");
        $dumpvars;

        // Farklı çarpma işlemleri
        num1 = 3'b000; num2 = 3'b000; #10;
        num1 = 3'b001; num2 = 3'b001; #10;
        num1 = 3'b010; num2 = 3'b001; #10;
        num1 = 3'b011; num2 = 3'b010; #10;
        num1 = 3'b100; num2 = 3'b011; #10;
        num1 = 3'b111; num2 = 3'b111; #10;
        num1 = 3'b101; num2 = 3'b110; #10;
        num1 = 3'b110; num2 = 3'b101; #10;

        // Testi bitir
        $finish;
    end
endmodule
