module tb_edge_detector;

reg clk, rst, sig;
wire rise_pulse, fall_pulse;

edge_detector uut (
    .clk(clk),
    .rst(rst),
    .sig(sig),
    .rise_pulse(rise_pulse),
    .fall_pulse(fall_pulse)
);

always #5 clk = ~clk;

always @(posedge clk)
    $display("sig=%b | rise_pulse=%b | fall_pulse=%b", sig, rise_pulse, fall_pulse);

initial begin
    clk = 0; rst = 1; sig = 0;
    #12 rst = 0;

    #10 sig = 1;
    #20 sig = 0;
    #20 sig = 1;
    #10 sig = 0;
    #20 $finish;
end

endmodule
