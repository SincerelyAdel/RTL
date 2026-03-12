module tb_regFile;

    reg clk, we;
    reg [4:0] rs1, rs2, rd;
    reg [31:0] wd;
    wire [31:0] rd1, rd2;

    regFile uut (
        .clk(clk),
        .we(we),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .wd(wd),
        .rd1(rd1),
        .rd2(rd2)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("../waveform/tb_regFile.vcd");
        $dumpvars(0, tb_regFile);
        
        $monitor("rd1: %0d | rd2: %0d", rd1, rd2);

        we = 0; rs1 = 0; rs2 = 0; rd = 0; wd = 0;
        we = 1; rd = 5'd1; wd = 32'd10; #10;
        rd = 5'd2; wd = 32'd20; #10;
        rd = 5'd0; wd = 32'd99; #10;
        we = 0; rs1 = 5'd1; rs2 = 5'd2; #10;
        rs1 = 5'd0; rs2 = 5'd0; #10;

        $stop;
    end

endmodule
