module trafficLight(clk, rst,
    A_green, A_yellow, A_red,
    B_green, B_yellow, B_red,
    C_green, C_yellow, C_red);

input clk, rst;
output A_green, A_yellow, A_red;
output B_green, B_yellow, B_red;
output C_green, C_yellow, C_red;

    localparam S_AG = 3'd0,
               S_AY = 3'd1,
               S_BG = 3'd2,
               S_BY = 3'd3,
               S_CG = 3'd4,
               S_CY = 3'd5;

    localparam GREEN_DUR  = 4'd9,
               YELLOW_DUR = 4'd2;

    reg [2:0] state, next_state;
    reg [3:0] counter;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state   <= S_AG;
            counter <= 4'd0;
        end else begin
            state   <= next_state;
            if (state != next_state)
                counter <= 4'd0;
            else
                counter <= counter + 4'd1;
        end
    end

    always @(*) begin
        case (state)
            S_AG: next_state = (counter == GREEN_DUR)  ? S_AY : S_AG;
            S_AY: next_state = (counter == YELLOW_DUR) ? S_BG : S_AY;
            S_BG: next_state = (counter == GREEN_DUR)  ? S_BY : S_BG;
            S_BY: next_state = (counter == YELLOW_DUR) ? S_CG : S_BY;
            S_CG: next_state = (counter == GREEN_DUR)  ? S_CY : S_CG;
            S_CY: next_state = (counter == YELLOW_DUR) ? S_AG : S_CY;
            default: next_state = S_AG;
        endcase
    end

    assign A_green  = (state == S_AG);
    assign A_yellow = (state == S_AY);
    assign A_red    = (state == S_BG) | (state == S_BY) | (state == S_CG) | (state == S_CY);

    assign B_green  = (state == S_BG);
    assign B_yellow = (state == S_BY);
    assign B_red    = (state == S_AG) | (state == S_AY) | (state == S_CG) | (state == S_CY);

    assign C_green  = (state == S_CG);
    assign C_yellow = (state == S_CY);
    assign C_red    = (state == S_AG) | (state == S_AY) | (state == S_BG) | (state == S_BY);

endmodule