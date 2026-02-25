module tb_fullAdder4bit;

reg [3:0] A, B;
reg Cin;
wire [3:0] Sum;
wire Cout;

    fullAdder4bit uut (
            .A(A),
            .B(B),
            .Cin(Cin),
            .Sum(Sum),
            .Cout(Cout)
            );

    initial begin
    $dumpfile("fullAdder4bit_tb.vcd");
    $dumpvars(0, tb_fullAdder4bit);

    $monitor("A=%b B=%b Cin=%b | Sum=%b Cout=%b", A, B, Cin, Sum, Cout);

    Cin = 0; A = 4'B0000; B = 4'B0000; #10;
    Cin = 0; A = 4'B0001; B = 4'B0001; #10;
    Cin = 0; A = 4'B0111; B = 4'B0001; #10;
    Cin = 1; A = 4'B0111; B = 4'B0001; #10;
    Cin = 0; A = 4'B1111; B = 4'B1111; #10;
    Cin = 1; A = 4'B1111; B = 4'B1111; #10;
    Cin = 0; A = 4'B1010; B = 4'B0101; #10;
    Cin = 1; A = 4'B1010; B = 4'B0101; #10;

    $finish;
    end

    endmodule
