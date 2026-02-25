module full_adder_decoder(I, Sum, Cout);

  input  [2:0] I;
  output Sum, Cout;

  wire [7:0] Y;

  decoder_3to8 dec(I, Y);

  assign Sum  = Y[1] | Y[2] | Y[4] | Y[7];
  assign Cout = Y[3] | Y[5] | Y[6] | Y[7];

endmodule
