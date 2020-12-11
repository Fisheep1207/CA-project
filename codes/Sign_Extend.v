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
            7'b0010011: data_o = {{20{data_i[31]}}, data_i[31:20]}; // others
            7'b0100011: data_o = {{20{data_i[31]}}, data_i[31:25], data_i[11:7]}; //sw
            7'b1100011: data_o = {{19{data_i[31]}}, data_i[31], data_i[7], data_i[30:25], data_i[11:8], 1'b0}; // beq
            7'b0000011: data_o = {{20{data_i[31]}}, data_i[31:20]}; // lw
            default: data_o = 0;
        endcase        
    end


endmodule 