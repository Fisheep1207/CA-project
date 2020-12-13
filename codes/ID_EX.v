module ID_EX
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
    ALUOp_o,
    ALUOp_i,
    ALUSrc_o,
    ALUSrc_i,
    Readdata1_o,
    Readdata1_i,
    Readdata2_o,
    Readdata2_i,
    Imm_o,
    Imm_i,
    ALU_o,
    ALU_i,
    INS_11_7_o,
    INS_11_7_i,
    Rs1_i,
    Rs1_o,
    Rs2_i,
    Rs2_o
);
input               clk_i;
input RegWrite_i, MemToReg_i, MemRead_i, MemWrite_i, ALUSrc_i;     
input [1:0] ALUOp_i;
input [31:0] Readdata1_i, Readdata2_i, Imm_i;
input [9:0] ALU_i;
input [4:0] INS_11_7_i, Rs1_i, Rs2_i;
output reg RegWrite_o, MemToReg_o, MemRead_o, MemWrite_o, ALUSrc_o;
output reg [1:0]    ALUOp_o;
output reg [31:0]   Readdata1_o, Readdata2_o, Imm_o;
output reg [9:0]    ALU_o;
output reg [4:0]    INS_11_7_o, Rs1_o, Rs2_o;

always@(posedge clk_i)  begin
    RegWrite_o  <= RegWrite_i;
    MemToReg_o  <= MemToReg_i;
    MemRead_o   <= MemRead_i;
    MemWrite_o  <= MemWrite_i; 
    ALUSrc_o    <= ALUSrc_i;
    ALUOp_o     <= ALUOp_i;
    Readdata1_o <= Readdata1_i; 
    Readdata2_o <= Readdata2_i;
    Imm_o       <= Imm_i;
    ALU_o       <= ALU_i;
    INS_11_7_o  <= INS_11_7_i;
    Rs1_o <= Rs1_i;
    Rs2_o <= Rs2_i;
end
endmodule
