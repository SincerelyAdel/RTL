module FA(A, B, Cin, Cout, Sum);

input A, B, Cin;
output Sum, Cout;

wire w1, w2, w3;

or o1(Cout, w2, w3);

HA HA0 (
	.A(A),
	.B(B),
	.S(w1),
	.C(w2)
);

HA HA1(
	.A(w1),
	.B(Cin),
	.S(Sum),
	.C(w3)
);
	
endmodule
