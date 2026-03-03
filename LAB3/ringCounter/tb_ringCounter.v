module tb_ring_counter;

parameter N = 8;

reg clk, rst, load;
reg [N-1:0] load_value;
wire [N-1:0] q;

ring_counter #(.N(N)) uut (
    .clk(clk),
    .rst(rst),
    .load(load),
    .load_value(load_value),
    .q(q)
);

always #5 clk = ~clk;

always @(posedge clk)
    $display("q=%b | load=%b | load_value=%b", q, load, load_value);

initial begin
    clk = 0; rst = 1; load = 0; load_value = 0;
    #12 rst = 0;

    #50;

    load = 1; load_value = 8'b00001000;
    #10 load = 0;

    #50 rst = 1;
    #10 rst = 0;

    #30 $finish;
end

endmodule
