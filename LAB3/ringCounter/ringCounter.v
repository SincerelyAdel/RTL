module ring_counter #(parameter N = 8) (clk, rst, load, load_value, q);

input clk;
input rst;
input load;
input [N-1:0] load_value;
output reg [N-1:0] q;

always @(posedge clk or posedge rst)
    if (rst)
        q <= {{N-1{1'b0}}, 1'b1};
    else if (load)
        q <= load_value;
    else
        q <= {q[N-2:0], q[N-1]};

endmodule
