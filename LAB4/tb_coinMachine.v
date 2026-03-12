module tb_coinMachine;

reg clk, rst, coin5, coin10, select;
wire dispense, change5;

coinMachine uut(clk, rst, coin5, coin10, select, dispense, change5);

initial clk = 0;
always #5 clk = ~clk;

task insert;
    input i5, i10;
    begin
        coin5 = i5; coin10 = i10;
        @(posedge clk); #1;
        coin5 = 0; coin10 = 0;
    end
endtask

initial begin
    rst = 1; coin5 = 0; coin10 = 0; select = 0;
    @(posedge clk); #1;
    rst = 0;

    $display("--- Test 1: 5 + 5 + 5 = dispense ---");
    insert(1, 0);
    insert(1, 0);
    insert(1, 0);

    $display("--- Test 2: 5 + 10 = dispense ---");
    insert(1, 0);
    insert(0, 1);

    $display("--- Test 3: 10 + 5 = dispense ---");
    insert(0, 1);
    insert(1, 0);

    $display("--- Test 4: 10 + 10 = dispense + change5 ---");
    insert(0, 1);
    insert(0, 1);

    $display("--- Test 5: reset mid-sequence ---");
    insert(1, 0);
    rst = 1;
    @(posedge clk); #1;
    rst = 0;
    insert(0, 1);
    insert(1, 0);

    #20;
    $stop;
end

always @(posedge clk) begin
    $display("coin5=%b coin10=%b | dispense=%b change5=%b | state=%b",
        coin5, coin10, dispense, change5, uut.current_state);
end

endmodule