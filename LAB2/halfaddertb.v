module halfaddertb ();
    reg A, B;
    wire S, C;

halfadder uut(
    .A(A), .B(B), .S(S), .C(C)
);

initial begin
    $dumpfile("hadmp.vcd");
    $dumpvars;
    A = 1'b0; B = 1'b0; #10;
    A = 1'b0; B = 1'b1; #10;
    A = 1'b1; B = 1'b0; #10;
    A = 1'b1; B = 1'b1; #10;
    $finish;
end

endmodule