module coinMachine(clk, rst, coin5, coin10, select, dispense, change5);
input clk, rst, coin5, coin10, select;
output reg dispense, change5;

parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;

reg [1:0] current_state, next_state;

always @(posedge clk or posedge rst) begin
    if (rst)
        current_state <= S0;
    else
        current_state <= next_state;
end

always @(*) begin
    dispense = 0;
    change5 = 0;
    next_state = current_state;

    case (current_state)
        S0: begin
            if (coin5)
                next_state = S1;
            else if (coin10)
                next_state = S2;
        end

        S1: begin
            if (coin5)
                next_state = S2;
            else if (coin10) begin
                dispense = 1;
                next_state = S0;
            end
        end

        S2: begin
            if (coin5) begin
                dispense = 1;
                next_state = S0;
            end else if (coin10) begin
                dispense = 1;
                change5 = 1;
                next_state = S0;
            end
        end

        default: next_state = S0;
    endcase
end

endmodule