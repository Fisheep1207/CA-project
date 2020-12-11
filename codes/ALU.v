
module ALU(
    data1_i,    //(ReadData1_to_ALU),
    data2_i,    //(MUX_to_ALU),
    ALUCtrl_i,  //(ALUControl_to_ALU),
    data_o,     //(ALUresult_to_WriteData),
    Zero_o     
);
input signed [31:0] data1_i, data2_i;
input signed [2:0] ALUCtrl_i;
output Zero_o;
output signed [31:0] data_o;
reg signed [31:0] tmp;
always@(data1_i or data2_i or ALUCtrl_i) begin
  case(ALUCtrl_i)                 
    3'b000  : tmp = data1_i + data2_i;      // add
    3'b001  : tmp = data1_i - data2_i;      // subtraction
    3'b010  : tmp = data1_i & data2_i;      // and
    3'b011  : tmp = data1_i ^ data2_i;      // xor
    3'b100  : tmp = data1_i * data2_i;      // mult
    3'b101  : tmp = data1_i << data2_i;     // shift left
    3'b110  : tmp = data1_i >>> data2_i[4:0];     // shift right arithmetic
  endcase
end
assign data_o=tmp;
endmodule 