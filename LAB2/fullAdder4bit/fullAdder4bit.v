module fullAdder4bit(A, B, Cin, Sum, Cout);
    input [3:0] A, B;
    input Cin;
    output [3:0] Sum;
    output Cout;

    wire w1, w2, w3;

    fullAdder FA0(A[0],  B[0], Cin, Sum[0], w1);
    fullAdder FA1(A[1],  B[1], w1, Sum[1], w2);
    fullAdder FA2(A[2],  B[2], w2, Sum[2], w3);
    fullAdder FA3(A[3],  B[3], w3, Sum[3], Cout);

endmodule
