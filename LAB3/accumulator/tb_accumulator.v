module tb_accumulator;

parameter N = 8;

reg clk, rst, enable;
reg [N-1:0] data_in;
wire [N-1:0] sum;

accumulator #(.N(N)) uut (
    .clk(clk),
    .rst(rst),
    .enable(enable),
    .data_in(data_in),
    .sum(sum)
);

always #5 clk = ~clk;

always @(posedge clk)
    $display("sum=%0d | enable=%b | data_in=%0d", sum, enable, data_in);

initial begin
    clk = 0; rst = 1; enable = 0; data_in = 0;
    #12 rst = 0;

    enable = 1; data_in = 8'd10;
    #10 data_in = 8'd20;
    #10 data_in = 8'd5;
    #10 enable = 0;
    #10 data_in = 8'd99;
    #10 enable = 1; data_in = 8'd1;
    #20 rst = 1;
    #10 rst = 0;
    #10 $finish;
end

endmodule
