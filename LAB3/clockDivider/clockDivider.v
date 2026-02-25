module clockDivider #(parameter DIV = 4)(clk, rst, clk_out);

  input  clk, rst;
  output reg clk_out;

  localparam HALF  = DIV / 2;
  localparam WIDTH = $clog2(DIV);

  reg [WIDTH-1:0] count;

  always @(posedge clk or posedge rst) begin
      if (rst) begin
          count   <= 0;
          clk_out <= 0;
      end else begin
          if (count == HALF - 1) begin
              clk_out <= ~clk_out;
              count   <= 0;
          end else begin
              count <= count + 1;
          end
      end
  end

endmodule
