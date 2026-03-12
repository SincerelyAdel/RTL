`timescale 1ns/1ps
module tb_FIFO;

    parameter WIDTH = 8;
    parameter DEPTH = 4;

    reg clk, rst, wr_en, re_en;
    reg [WIDTH-1:0] data_in;
    wire full, empty;
    wire [WIDTH-1:0] data_out;

    FIFO #(.WIDTH(WIDTH), .DEPTH(DEPTH)) uut (
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
        .wr_en(wr_en),
        .re_en(re_en),
        .data_out(data_out),
        .full(full),
        .empty(empty)
    );

    always #5 clk = ~clk;

    task write;
        input [WIDTH-1:0] d;
        begin
            @(negedge clk);
            wr_en = 1; re_en = 0; data_in = d;
            @(posedge clk);
            wr_en = 0;
        end
    endtask

    task read;
        begin
            @(negedge clk);
            re_en = 1; wr_en = 0;
            @(posedge clk);
            re_en = 0;
        end
    endtask

    initial begin
        clk = 0; rst = 1; wr_en = 0; re_en = 0; data_in = 0;
        @(posedge clk); @(posedge clk);
        rst = 0;

        $display("--- Fill FIFO ---");
        write(8'hAA);
        write(8'hBB);
        write(8'hCC);
        write(8'hDD);
        $display("full=%b (expect 1)", full);

        $display("--- Write while full (should be ignored) ---");
        write(8'hFF);
        $display("count unchanged, full=%b", full);

        $display("--- Drain FIFO ---");
        read; $display("data_out=%h (expect AA)", data_out);
        read; $display("data_out=%h (expect BB)", data_out);
        read; $display("data_out=%h (expect CC)", data_out);
        read; $display("data_out=%h (expect DD)", data_out);
        $display("empty=%b (expect 1)", empty);

        $display("--- Read while empty (should be ignored) ---");
        read;
        $display("empty=%b (expect 1)", empty);

        $display("--- Interleaved write/read ---");
        write(8'h11);
        write(8'h22);
        read; $display("data_out=%h (expect 11)", data_out);
        write(8'h33);
        read; $display("data_out=%h (expect 22)", data_out);
        read; $display("data_out=%h (expect 33)", data_out);

        $display("--- Reset mid-operation ---");
        write(8'hAB);
        write(8'hCD);
        rst = 1;
        @(posedge clk);
        rst = 0;
        $display("empty=%b (expect 1)", empty);

        $finish;
    end

    initial $monitor("clk=%b wr=%b re=%b din=%h | dout=%h full=%b empty=%b",
                      clk, wr_en, re_en, data_in, data_out, full, empty);

endmodule