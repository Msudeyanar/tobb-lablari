module halfAdder (
   input  A,B,
   output S, Cout
);
xor(S,A,B);
and(Cout,A,B);

endmodule