module bit_karsilastiricitb ();
    reg A, B;
    wire AkB, AeB, AbB;

    bit_karsilastirici uut (
        .A(A),
        .B(B),
        .AkB(AkB),
        .AeB(AeB),
        .AbB(AbB)
    );

    initial begin
        $dumpfile("fdmp.vcd");
        $dumpvars;

        A = 0; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;

        $display(AkB);
        $display(AeB);
        $display(AbB);

        $finish;
    end
endmodule

