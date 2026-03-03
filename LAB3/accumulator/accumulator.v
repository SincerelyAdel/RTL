module accumulator #(
    parameter N = 8
)(
    input clk,
    input rst,
    input enable,
    input [N-1:0] data_in,
    output reg [N-1:0] sum
);

    always @(posedge clk or posedge rst)
        if (rst)
            sum <= {N{1'b0}};
        else if (enable)
            sum <= sum + data_in;
endmodule
