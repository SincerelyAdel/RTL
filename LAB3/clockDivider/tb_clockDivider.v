module tb_clockDivider;

  reg  clk, rst;
  wire clk_out;

  clockDivider #(.DIV(8)) uut(clk, rst, clk_out);

  initial clk = 0;
  always #5 clk = ~clk;

  initial begin
      rst = 1;
      #20;
      rst = 0;
      #200;
      $finish;
  end

  initial begin
      $monitor("clk=%b | rst=%b | clk_out=%b", clk, rst, clk_out);
  end

endmodule
