module tb_mux8to1;

    reg [2:0] sel;
    reg [7:0] in;
    wire out;

    mux8to1 uut (
        .sel(sel),
        .in(in),
        .out(out)
    );

    initial begin
        $dumpfile("tb_mux8to1.vcd");
        $dumpvars(0, tb_mux8to1);

        $monitor("sel=%b  in=%b  out=%b", sel, in, out);

        in = 8'b10110100;

        sel = 3'b000; #10;
        sel = 3'b001; #10;
        sel = 3'b010; #10;
        sel = 3'b011; #10;
        sel = 3'b100; #10;
        sel = 3'b101; #10;
        sel = 3'b110; #10;
        sel = 3'b111; #10;

        $finish;
    end

endmodule
