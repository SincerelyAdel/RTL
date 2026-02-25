module one_hot(in, valid);
input  [3:0] in;
output reg valid;

always @(*)
    valid = (in != 0) && ((in & (in - 1)) == 0);

endmodule


// Case-based approach — easier to read
// // module one_hot(in, valid);
// // input  [3:0] in;
// // output reg valid;
// // 
// // always @(*) begin
// //     case (in)
// //         4'b0001, 4'b0010,
// //         4'b0100, 4'b1000: valid = 1;
// //         default:          valid = 0;
// //     endcase
// // end
// // 
// // endmodule
