module edge_detector (
    input clk,
    input rst,
    input sig,
    output rise_pulse,
    output fall_pulse
);

reg sig_prev;

always @(posedge clk or posedge rst)
    if (rst)
        sig_prev <= 1'b0;
    else
        sig_prev <= sig;

    assign rise_pulse = sig & ~sig_prev;
    assign fall_pulse = ~sig & sig_prev;

endmodule