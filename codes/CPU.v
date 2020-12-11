module CPU
(
    clk_i, 
    rst_i,
    start_i
);
// Ports
input               clk_i;
input               rst_i;
input               start_i;
wire ALUSrc, RegWrite, MemToReg, MemWrite, MemRead;
wire [1:0] ALUOp;
wire [2:0] ALUControl_To_ALU;
wire [31:0] Ins, Add_To_PC, PC_To_Ins_Mem, Ins_SignEx_To_MUX, ALUresult,
            ReadData1_To_ALU, ReadData2_To_MUX, MUX1_To_ALU, IF_ID_INS;
wire [31:0] DataMemory_ReadData, MUX2result;

Data_Memory Data_Memory(
    .clk_i (clk_i), 
    .addr_i (ALUresult), 
    .MemRead_i (MemRead),
    .MemWrite_i (MemWrite),
    .data_i (ReadData2_To_MUX),
    .data_o (DataMemory_ReadData)
);

Control Control(
    // Load / STore Operations
    .Op_i       (IF_ID_INS[6:0]),
    .MemToReg_o   (MemToReg),
    .MemRead_o  (MemRead),
    .MemWrite_o (MemWrite),
    .ALUOp_o    (ALUOp),
    .ALUSrc_o   (ALUSrc),
    .RegWrite_o (RegWrite)
);

Adder Add_PC(
    // Load / STore Operations
    .data1_in   (PC_To_Ins_Mem),
    .data2_in   (4),
    .data_o     (Add_To_PC)
);

PC PC(
    // Load / STore Operations
    .clk_i      (clk_i),
    .rst_i      (rst_i),
    .start_i    (start_i),
    .pc_i       (Add_To_PC),
    .pc_o       (PC_To_Ins_Mem)
);

Instruction_Memory Instruction_Memory(
    // Load / STore Operations
    .addr_i     (PC_To_Ins_Mem), 
    .instr_o    (IF_ID_INS[31:0])
);

Registers Registers(
    // Load / STore Operations
    .clk_i      (clk_i),
    .RD1addr_i   (IF_ID_INS[19:15]),
    .RD2addr_i   (IF_ID_INS[24:20]),
    .WRaddr_i   (IF_ID_INS[11:7]),  // Write register
    .WRdata_i   (MUX2result), // Write data
    .RegWrite_i (RegWrite), 
    .RD1data_o   (ReadData1_To_ALU), 
    .RD2data_o   (ReadData2_To_MUX) 
);

MUX32 MUX_ALUSrc(
    // Load / STore Operations
    .data1_i    (ReadData2_To_MUX),
    .data2_i    (Ins_SignEx_To_MUX),
    .select_i   (ALUSrc),
    .data_o     (MUX1_To_ALU)
);

MUX32 MUX_RegisterSrc(
    // Load / STore Operations
    .data1_i    (ALUresult),
    .data2_i    (DataMemory_ReadData),
    .select_i   (MemToReg),
    .data_o     (MUX2result)
);

Sign_Extend Sign_Extend(
    // Load / STore Operations
    .data_i     (IF_ID_INS[31:20]),
    .data_o     (Ins_SignEx_To_MUX)
);

ALU ALU(
    .data1_i    (ReadData1_To_ALU),
    .data2_i    (MUX1_To_ALU),
    .ALUCtrl_i  (ALUControl_To_ALU),
    .data_o     (ALUresult),
    .Zero_o     ()
);

ALU_Control ALU_Control(
    .funct_i    ({IF_ID_INS[31:25], IF_ID_INS[14:12]}),
    .ALUOp_i    (ALUOp),
    .ALUCtrl_o  (ALUControl_To_ALU)
);

IF_ID IF_IF(
    .IF_ID_i(Ins[31:0]),
    ,IF_ID_o(IF_ID_INS),
);

endmodule

