module Sign_Extend(
    data_i,     //(Ins[31:20]),
    data_o      //(Ins_SignEx_to_MUX)
);

input   [31:0]  data_i;
output  [31:0]  data_o;

assign data_o = {{20{data_i[11]}},data_i[11:0]};

endmodule 