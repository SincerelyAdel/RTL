module ALU(A, B, sel, result);
    input [31:0] A, B;
    input [3:0] sel;
    output reg [31:0] result;

    always @(*) begin
        case (sel)
            4'b0000: result = A & B;
            4'b0001: result = A | B;
            4'b0010: result = A + B;
            4'b0011: result = A ^ B;
            4'b0100: result = A << B[4:0];
            4'b0101: result = A >> B[4:0];
            4'b0110: result = A - B;
            4'b0111: result = $signed(A) >>> B[4:0];
            4'b1000: result = ($signed(A) < $signed(B)) ? 32'd1 : 32'd0;
            4'b1001: result = (A < B) ? 32'd1 : 32'd0;
            default: result = 32'd0;
        endcase
    end
endmodule