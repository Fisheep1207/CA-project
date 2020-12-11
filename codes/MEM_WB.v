module MEM_WB
(   
    RegWrite_o,
    RegWrite_i,
    MemtoReg_o,
    MemtoReg_i,
    ALUresult_o,
    ALUresult_i,
    Readdata_o,
    Readdata_i,
    INS_11_7_o,
    INS_11_7_i,
);
input RegWrite_i, MemtoReg_i;
input [31:0] ALUresult_i, Readdata_i;
input [4:0] INS_11_7_i;
output reg RegWrite_o, MemtoReg_o;
output reg [31:0] ALUresult_o, Readdata_o;
output reg [4:0] INS_11_7_o;

always@(*)  begin
    RegWrite_o  <= RegWrite_i;
    MemtoReg_o  <= MemtoReg_i;
    Readdata_o <= Readdata_i;
    ALUresult_o <= ALUresult_i;
    INS_11_7_o  <= INS_11_7_i;
end
endmodule