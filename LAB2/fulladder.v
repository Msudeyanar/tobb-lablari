module fulladder (
    input A,
    input B,
    input Cin,
    output S,
    output Cout,    
);
   wire  AXB,AnB1, AnB2 ;
   halfadder h1 (A,B,AXB,AnB2);
   halfadder h2 (AXB,Cin,S, AnB1);
   or o1 (Cout,AnB1,AnB2);
   
   
    
endmodule