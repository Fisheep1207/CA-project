module Equal(
    input1_i,
    input2_i,
    data_o
);

input [31:0] input1_i, input2_i;
output reg data_o;

always@(input1_i, input2_i) 
    data_o = (input1_i == input2_i);

endmodule