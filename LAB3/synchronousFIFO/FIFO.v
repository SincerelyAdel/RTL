module FIFO(parameter WIDTH = 8, parameter DEPTH = 4) (clk, rst, data_in, wr_en, re_en, data_out, full, empty);
    input clk, rst, wr_en, re_en;
    input [WIDTH-1:0] data_in;

    output full, empty;
    output reg [WIDTH-1:0] data_out;

    reg [WIDTH-1:0] memory [0:DEPTH-1];
    reg [$clog2(DEPTH):0] count;
    integer i;

    assign full = (count == DEPTH);
    assign empty = (count == 0);

    always @(posedge clk) begin
        if (rst) begin
            count <= 0;
            data_out <= 0;
            for (i = 0; i < DEPTH; i++)
                memory[i] <= 0;
        end else begin
            if (!full && wr_en && !(!empty && re_en)) begin
                memory[count] <= data_in;
                count <= count + 1;
            end 

            if (!empty && re_end && !(!full && wr_en)) begin
                data_out <= memory[0];
                for (i = 0; i < DEPTH; i = i + 1)
                    memory[i] <= memory[i+1];
                count <= count - 1;
            end
        end
    end
endmodule
