module pc(
    input        clk, rst,
    input        branch,
    input  [31:0] branch_target,
    output reg [31:0] pc
);

    always @(posedge clk) begin
        if (rst)
            pc <= 32'd0;
        else if (branch)
            pc <= branch_target;
        else
            pc <= pc + 32'd4;
    end

endmodule