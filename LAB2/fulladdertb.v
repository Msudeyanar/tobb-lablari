module fulladdertb ();

reg r1, r2, r3;
wire w1, w2;

fulladder uut(
    .A(r1),
    .B(r2),
    .Cin(r3),
    .S(w1),
    .Cout(w2)
);

initial begin
    $dumpfile("fdmp.vcd");
    $dumpvars;
    r1 = 0; r2 = 0; r3 = 0; #10
    r1 = 0; r2 = 0; r3 = 1; #10
    r1 = 0; r2 = 1; r3 = 0; #10
    r1 = 0; r2 = 1; r3 = 1; #10
    r1 = 1; r2 = 0; r3 = 0; #10
    r1 = 1; r2 = 0; r3 = 1; #10
    r1 = 1; r2 = 1; r3 = 0; #10
    r1 = 1; r2 = 1; r3 = 1; #10



    
    $display( w1);
    $display( w2);
    
end

endmodule