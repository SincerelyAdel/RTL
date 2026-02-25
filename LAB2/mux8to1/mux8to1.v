module mux8to1(in, sel, out);
    input [7:0] in;
    input [2:0] sel;
    output out;

    wire w1, w2;

    mux4to1 m1(in[3:0], sel[1:0], w1);
    mux4to1 m2(in[7:4], sel[1:0], w2);
    mux2to1 m3({w1, w2}, sel[2], out);

endmodule
