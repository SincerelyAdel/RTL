module ALUCtrl(
    input [6:0] funct7,
    input [2:0] funct3,
    output reg [3:0] alu_ctrl
);

always @(*) begin
    case({funct7, funct3})
        10'b0000000_000: alu_ctrl = 4'b0010;
        10'b0100000_000: alu_ctrl = 4'b0110;
        10'b0000000_111: alu_ctrl = 4'b0000;
        10'b0000000_110: alu_ctrl = 4'b0001;
        10'b0000000_100: alu_ctrl = 4'b0011;
        10'b0000000_001: alu_ctrl = 4'b0100;
        10'b0000000_101: alu_ctrl = 4'b0101;
        10'b0100000_101: alu_ctrl = 4'b0111;
        10'b0000000_010: alu_ctrl = 4'b1000;
        10'b0000000_011: alu_ctrl = 4'b1001;
        default: alu_ctrl = 4'b0000;
    endcase
end

endmodule
