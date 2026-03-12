`timescale 1ns/1ps

module CPU;

    reg clk;
    reg rst;

    top uut(
        .clk(clk),
        .rst(rst)
    );

    initial begin
        $dumpfile("../waveform/CPU.vcd");
        $dumpvars(0, CPU);

        clk = 0;
        rst = 1;

        #10 rst = 0;

        #200;
        $display("Register Values:");
        $display("x0 = %d", uut.RF.regs[0]);
        $display("x1 = %d", uut.RF.regs[1]);
        $display("x2 = %d", uut.RF.regs[2]);
        $display("x3 = %d", uut.RF.regs[3]);
        $display("x4 = %d", uut.RF.regs[4]);
        $display("x5 = %d", uut.RF.regs[5]);
        $display("x6 = %d", uut.RF.regs[6]);
        $display("x7 = %d", uut.RF.regs[7]);

        $stop;
    end

    always #5 clk = ~clk;

endmodule
