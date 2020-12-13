module Shift(
    data_i,
    data_o
);

input [31:0] data_i;
output reg [31:0] data_o;

always@(data_i) 
    data_o = data_i << 1;

endmodule