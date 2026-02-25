module fullAdder(A, B, Cin, Sum, Cout);
    input A, B, Cin;
    output Sum, Cout;

    mux8to1 m1(
        .in(8'b01101001),
        .sel({A, B, Cin}),
        Sum
    );

    mux8to1 m2(
        .in(8'b00010111),
        .sel({A, B, Cin}),
        Cout
    );

endmodule 
