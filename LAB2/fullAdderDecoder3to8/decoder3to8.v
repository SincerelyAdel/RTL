module decoder_3to8(I, Y);
  input [2:0] I;
  output [7:0] Y;

  assign Y[0] = ~I[2] & ~I[1] & ~I[0];
  assign Y[1] = ~I[2] & ~I[1] &  I[0];
  assign Y[2] = ~I[2] &  I[1] & ~I[0];
  assign Y[3] = ~I[2] &  I[1] &  I[0];
  assign Y[4] =  I[2] & ~I[1] & ~I[0];
  assign Y[5] =  I[2] & ~I[1] &  I[0];
  assign Y[6] =  I[2] &  I[1] & ~I[0];
  assign Y[7] =  I[2] &  I[1] &  I[0];

endmodule
