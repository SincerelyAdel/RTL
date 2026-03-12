module tb_ROM;

    reg [31:0] addr;
    wire [31:0] instr;
    wire [31:0] word_addr;
    assign word_addr = addr >> 2;

    ROM uut (
        .addr(addr),
        .instr(instr)
    );

    initial begin
        $dumpfile("../waveform/tb_ROM.vcd");
        $dumpvars(0, tb_ROM);
        $monitor("addr: %0d | instr: %b", word_addr, instr);

        addr = 32'd0;  #10;
        addr = 32'd4;  #10;
        addr = 32'd8;  #10;
        addr = 32'd12; #10;
        addr = 32'd16; #10;

        $stop;
    end

endmodule