module Sign_Extend(
    data_i,     //(Ins[31:20]),
    data_o      //(Ins_SignEx_to_MUX)
);

input   [31:0]  data_i;
output [31:0]  data_o;

reg [31:0] data_o;

always@(data_i)
    begin
        case (data_i[6:0])
            7'b0010011: data_o = {{20{data_i[31]}}, data_i[31:20]};
            7'b0100011: data_o = {{20{data_i[31]}}, data_i[31:25], data_i[4:0]};
            7'b1100011: data_o = {{20{data_i[31]}}, data_i[31], data_i[0], data_i[30:25], data_i[4:1]};
            7'b0000011: data_o = {{20{data_i[31]}}, data_i[31:20]};
            default: data_o = 0;
        endcase        
    end


endmodule 