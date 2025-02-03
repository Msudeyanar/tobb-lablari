module mult2bitTB;
    reg [1:0] num1, num2;    // Girişler
    wire [3:0] result;        // Çıkış

    // Mult2bit modülünü instantiation
    mult2bit uut (
        .num1(num1),
        .num2(num2),
        .result(result)
    );

    initial begin
        // Test için VCD dosyası oluşturuluyor
        $dumpfile("mult2bit.vcd");
        $dumpvars;

        // Farklı çarpma işlemleri
        num1 = 2'b00; num2 = 2'b00; #10;
        num1 = 2'b01; num2 = 2'b01; #10;
        num1 = 2'b10; num2 = 2'b01; #10;
        num1 = 2'b11; num2 = 2'b10; #10;
        num1 = 2'b01; num2 = 2'b10; #10;
        num1 = 2'b11; num2 = 2'b11; #10;
        $finish;
    end
endmodule

