module MEM_WB
(   
    clk_i,
    RegWrite_o,
    RegWrite_i,
    MemToReg_o,
    MemToReg_i,
    ALUresult_o,
    ALUresult_i,
    Readdata_o,
    Readdata_i,
    INS_11_7_o,
    INS_11_7_i
);
input               clk_i;
input RegWrite_i, MemToReg_i;
input [31:0] ALUresult_i, Readdata_i;
input [4:0] INS_11_7_i;
output reg RegWrite_o, MemToReg_o;
output reg [31:0] ALUresult_o, Readdata_o;
output reg [4:0] INS_11_7_o;

always@(clk_i)  begin
    RegWrite_o  <= RegWrite_i;
    MemToReg_o  <= MemToReg_i;
    Readdata_o  <= Readdata_i;
    ALUresult_o <= ALUresult_i;
    INS_11_7_o  <= INS_11_7_i;
end
endmodule