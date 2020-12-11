module EX_MEM
(   
    clk_i,
    RegWrite_o,
    RegWrite_i,
    MemToReg_o,
    MemToReg_i,
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
input               clk_i;
input RegWrite_i, MemToReg_i, MemRead_i, MemWrite_i;     
input [31:0] Readdata2_i, ALUresult_i;
input [4:0]  INS_11_7_i;
output reg RegWrite_o, MemToReg_o, MemRead_o, MemWrite_o;
output reg [31:0]   Readdata2_o, ALUresult_o;
output reg [4:0]    INS_11_7_o;

always@(posedge clk_i)  begin
    RegWrite_o  <= RegWrite_i;
    MemToReg_o  <= MemToReg_i;
    MemRead_o   <= MemRead_i;
    MemWrite_o  <= MemWrite_i; 
    Readdata2_o <= Readdata2_i;
    ALUresult_o <= ALUresult_i;
    Readdata2_o <= Readdata2_i;
    INS_11_7_o  <= INS_11_7_i;
end
endmodule