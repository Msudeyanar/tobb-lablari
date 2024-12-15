module fullAdder (
   input A,B,Cin,
   output S,Cout
);

halfAdder h0(
   A,
   B,
   AxB,
   AnB2
);
halfAdder h1(
   A,
   Cin,
   S,
   AnB1
);
or(Cout,AnB1,AnB2);

endmodule