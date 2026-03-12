module ROM(
    input [31:0] addr,
    output [31:0] instr
);

    reg [31:0] memory [0:255];

    assign instr = memory[addr[31:2]];

    initial begin
        memory[0] = 32'b0000000_00010_00001_000_00011_0110011;
        memory[1] = 32'b0100000_00001_00011_000_00100_0110011;
        memory[2] = 32'b0000000_00100_00011_111_00101_0110011;
        memory[3] = 32'b0000000_00001_00101_110_00110_0110011;
        memory[4] = 32'b0000000_00010_00110_100_00111_0110011;
    end

endmodule