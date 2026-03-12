`timescale 1ns / 1ps

module tb_ALU;

    reg [31:0] A;
    reg [31:0] B;
    reg [3:0] sel;

    wire [31:0] result;

    ALU uut (
        .A(A),
        .B(B),
        .sel(sel),
        .result(result)
    );

    initial begin
        $dumpfile("../waveform/tb_ALU.vcd");
        $dumpvars(0, tb_ALU);
        $monitor("A: %h | B: %h | sel: %b | result: %h", A, B, sel, result);

        A = 32'hAAAAAAAA; B = 32'h55555555; sel = 4'b0000; #10;
        A = 32'hAAAAAAAA; B = 32'h55555555; sel = 4'b0001; #10;
        A = 32'd10; B = 32'd20; sel = 4'b0010; #10;
        A = 32'hAAAAAAAA; B = 32'h55555555; sel = 4'b0011; #10;
        A = 32'h00000001; B = 32'd5; sel = 4'b0100; #10;
        A = 32'h80000000; B = 32'd1; sel = 4'b0101; #10;
        A = 32'd30; B = 32'd10; sel = 4'b0110; #10;
        A = 32'h80000000; B = 32'd1; sel = 4'b0111; #10;
        A = 32'hFFFFFFFF; B = 32'd0; sel = 4'b1000; #10;
        A = 32'd0; B = 32'hFFFFFFFF; sel = 4'b1000; #10;
        A = 32'hFFFFFFFF; B = 32'd0; sel = 4'b1001; #10;
        A = 32'd0; B = 32'hFFFFFFFF; sel = 4'b1001; #10;
        sel = 4'b1111; #10;

        $stop;
    end

endmodule