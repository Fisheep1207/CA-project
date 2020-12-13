module And_Gat(
    input1_i,
    input2_i,
    data_o
);

input input1_i, input2_i;
output reg data_o;

always@(input1_i, input2_i) 
    data_o = (input1_i & input2_i);


endmodule