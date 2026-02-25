module tb_mux2to1;

    reg a;
    reg b;
    reg sel;
    wire y;

    // Instantiate DUT
    mux2to1 dut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    initial begin
        // VCD file for waveform viewing
        $dumpfile("wave.vcd");
        $dumpvars(0, dut); // dump all signals in testbench and DUT

        // Monitor signals in console
        $monitor("Time=%02t | sel=%b a=%b b=%b | y=%b",
                  $time, sel, a, b, y);

        // Test vectors
        a = 0; b = 0; sel = 0; #10;
        a = 0; b = 1; sel = 0; #10;
        a = 1; b = 0; sel = 1; #10;
        a = 1; b = 1; sel = 1; #10;

        $finish;
    end

endmodule
