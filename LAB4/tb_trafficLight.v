module tb_trafficLight;

reg clk, rst;
wire A_green, A_yellow, A_red;
wire B_green, B_yellow, B_red;
wire C_green, C_yellow, C_red;

    trafficLight uut(
        clk, rst,
        A_green, A_yellow, A_red,
        B_green, B_yellow, B_red,
        C_green, C_yellow, C_red
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst = 1;
        #12;
        rst = 0;
    end

    always @(posedge clk) begin
        $display("A: G=%b Y=%b R=%b | B: G=%b Y=%b R=%b | C: G=%b Y=%b R=%b",
            A_green, A_yellow, A_red,
            B_green, B_yellow, B_red,
            C_green, C_yellow, C_red);
    end

    initial begin
        #800;
        $stop;
    end

endmodule