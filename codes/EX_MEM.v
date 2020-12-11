module EX_MEM
(   
    RegWrite_o,
    RegWrite_i,
    MemtoReg_o,
    MemtoReg_i,
    MemRead_o,
    MemRead_i,
    MemWrite_o,
    MemWrite_i,
    ALUresult_o,
    ALUresult_i,
    Readdata2_o,
    Readdata2_i,
    INS_11_7_o,
    INS_11_7_i
);
input RegWrite_i, MemtoReg_i, MemRead_i, MemWrite_i;     
input [31:0] Readdata2_i, ALUresult_i;
input [4:0]  INS_11_7_i;
output reg RegWrite_o, MemtoReg_o, MemRead_o, MemWrite_o;
output reg [31:0]   Readdata2_o, ALUresult_o;
output reg [4:0]    INS_11_7_o;

always@(*)  begin
    RegWrite_o  <= RegWrite_i;
    MemtoReg_o  <= MemtoReg_i;
    MemRead_o   <= MemtoRead_i;
    MemWrite_o  <= MemWrite_i; 
    Readdata2_o <= Readdata2_i;
    ALUresult_o <= ALUresult_i;
    Readdata2_o <= Readdata2_i;
    INS_11_7_o  <= INS_11_7_i;
end
endmodule