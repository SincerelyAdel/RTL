module tb_pc;

    reg        clk, rst, branch;
    reg  [31:0] branch_target;
    wire [31:0] pc;

    pc uut (
        .clk(clk),
        .rst(rst),
        .branch(branch),
        .branch_target(branch_target),
        .pc(pc)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("../waveform/tb_pc.vcd");
        $dumpvars(0, tb_pc);
        $monitor("pc: %0d", pc);

        rst = 1; branch = 0; branch_target = 0; #10;
        rst = 0;

        #10; #10; #10;

        branch = 1; branch_target = 32'd32; #10;
        branch = 0;

        #10; #10;

        $stop;
    end

endmodule