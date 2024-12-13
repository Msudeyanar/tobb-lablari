   module bit_karsilastirici (
   input A,
   input B,
   output AkB,  // AküçükB
   output AeB,  //A==B
   output AbB // AbüyükB
   );

wire A1,B1;


//NOT kapıları
   not n1 (A1,A);
   not n2 (B1,B);

// AND kapıları
   and a1(A1nB,A1,B);
   and a2 (AnB1,A,B1);

//NOR Kapısı
   nor nor1 (AeB,A1nB,AnB1);


endmodule
