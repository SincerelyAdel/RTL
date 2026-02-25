`timescale 1ns/1ps

module tb_HA;

    reg  A, B;
    wire S, C;

    HA uut (
        .A(A),
        .B(B),
        .S(S),
        .C(C)
    );

    initial begin
        $display("A  B | S  C");
        $display("-----|-----");

        A = 0; B = 0; #10;
        $display("%b  %b | %b  %b", A, B, S, C);

        A = 0; B = 1; #10;
        $display("%b  %b | %b  %b", A, B, S, C);

        A = 1; B = 0; #10;
        $display("%b  %b | %b  %b", A, B, S, C);

        A = 1; B = 1; #10;
        $display("%b  %b | %b  %b", A, B, S, C);

        $finish;
    end

endmodule
