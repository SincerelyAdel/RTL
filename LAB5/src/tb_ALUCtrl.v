`timescale 1ns / 1ps

module tb_ALUCtrl;

    reg [6:0] funct7;
    reg [2:0] funct3;

    wire [3:0] alu_ctrl;

    ALUCtrl uut (
        .funct7(funct7),
        .funct3(funct3),
        .alu_ctrl(alu_ctrl)
    );

    initial begin
        $dumpfile("../waveform/tb_ALUCtrl.vcd");
        $dumpvars(0, tb_ALUCtrl);
        $monitor("funct7: %b | funct3: %b | alu_ctrl: %b", funct7, funct3, alu_ctrl);

        funct7 = 7'b0000000; funct3 = 3'b000; #10;
        funct7 = 7'b0100000; funct3 = 3'b000; #10;
        funct7 = 7'b0000000; funct3 = 3'b111; #10;
        funct7 = 7'b0000000; funct3 = 3'b110; #10;
        funct7 = 7'b0000000; funct3 = 3'b100; #10;
        funct7 = 7'b0000000; funct3 = 3'b001; #10;
        funct7 = 7'b0000000; funct3 = 3'b101; #10;
        funct7 = 7'b0100000; funct3 = 3'b101; #10;
        funct7 = 7'b0000000; funct3 = 3'b010; #10;
        funct7 = 7'b0000000; funct3 = 3'b011; #10;
        funct7 = 7'b1111111; funct3 = 3'b111; #10;

        $stop;
    end

endmodule
