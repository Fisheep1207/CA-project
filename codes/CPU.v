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

Data_Memory Data_Memory(
    .clk_i (clk_i), 
    .addr_i (EX_MEM.ALUresult_o), 
    .MemRead_i (EX_MEM.MemRead_o),
    .MemWrite_i (EX_MEM.MemWrite_o),
    .data_i (EX_MEM.Readdata2_o),
    .data_o ()
);

Control Control(
    // Load / STore Operations
    .Op_i       (IF_ID.IF_ID_o[6:0]),
    .MemToReg_o   (),
    .MemRead_o  (),
    .MemWrite_o (),
    .ALUOp_o    (),
    .ALUSrc_o   (),
    .RegWrite_o ()
);

Adder Add_PC(
    // Load / STore Operations
    .data1_in   (PC.pc_o),
    .data2_in   (4),
    .data_o     ()
);

PC PC(
    // Load / STore Operations
    .clk_i      (clk_i),
    .rst_i      (rst_i),
    .start_i    (start_i),
    .pc_i       (Add_PC.data_o),
    .pc_o       ()
);

Instruction_Memory Instruction_Memory(
    // Load / STore Operations
    .addr_i     (PC.pc_o), 
    .instr_o    ()
);

Registers Registers(
    // Load / STore Operations
    .clk_i      (clk_i),
    .RD1addr_i   (IF_ID.IF_ID_o[19:15]),
    .RD2addr_i   (IF_ID.IF_ID_o[24:20]),
    .WRaddr_i   (MEM_WB.INS_11_7_o),  // Write register
    .WRdata_i   (MUX_RegisterSrc.data_o), // Write data
    .RegWrite_i (MEM_WB.RegWrite_o), 
    .RD1data_o   (), 
    .RD2data_o   () 
);

MUX32 MUX_ALUSrc(
    // Load / STore Operations
    .data1_i    (ID_EX.Readdata2_o),
    .data2_i    (ID_EX.Imm_o),
    .select_i   (ID_EX.ALUSrc_o),
    .data_o     ()
);

MUX32 MUX_RegisterSrc(
    // Load / STore Operations
    .data1_i    (MEM_WB.ALUresult_o),
    .data2_i    (MEM_WB.Readdata_o),
    .select_i   (MEM_WB.MemToReg_o),
    .data_o     ()
);

Sign_Extend Sign_Extend(
    // Load / STore Operations
    .data_i     (IF_ID.IF_ID_o[31:0]),
    .data_o     ()
);

ALU ALU(
    .data1_i    (ID_EX.Readdata1_o),
    .data2_i    (MUX_ALUSrc.data_o),
    .ALUCtrl_i  (ALU_Control.ALUCtrl_o),
    .data_o     (),
    .Zero_o     ()
);

ALU_Control ALU_Control(
    .funct_i    (ID_EX.ALU_o),
    .ALUOp_i    (ID_EX.ALUOp_o),
    .ALUCtrl_o  ()
);

IF_ID IF_ID(
    .IF_ID_i(Instruction_Memory.instr_o),
    .IF_ID_o()
);

ID_EX ID_EX(
    .RegWrite_o(),
    .RegWrite_i(Control.RegWrite_o),
    .MemToReg_o(),
    .MemToReg_i(Control.MemToReg_o),
    .MemRead_o(),
    .MemRead_i(Control.MemRead_o),
    .MemWrite_o(),
    .MemWrite_i(Control.MemWrite_o),
    .ALUOp_o(),
    .ALUOp_i(Control.ALUOp_o),
    .ALUSrc_o(),
    .ALUSrc_i(Control.ALUSrc_o),
    .Readdata1_o(),
    .Readdata1_i(Registers.RD1data_o),
    .Readdata2_o(),
    .Readdata2_i(Registers.RD2data_o),
    .Imm_o(),
    .Imm_i(Sign_Extend.data_o),
    .ALU_o(),
    .ALU_i({IF_ID.IF_ID_o[31:25], IF_ID.IF_ID_o[14:12]}),
    .INS_11_7_o(),
    .INS_11_7_i(IF_ID.IF_ID_o[11:7])
);

EX_MEM EX_MEM(
    .RegWrite_o(),
    .RegWrite_i(ID_EX.RegWrite_o),
    .MemToReg_o(),
    .MemToReg_i(ID_EX.MemToReg_o),
    .MemRead_o(),
    .MemRead_i(ID_EX.MemRead_o),
    .MemWrite_o(),
    .MemWrite_i(ID_EX.MemWrite_o),
    .ALUresult_o(),
    .ALUresult_i(ALU.data_o),
    .Readdata2_o(),
    .Readdata2_i(ID_EX.Readdata2_o),
    .INS_11_7_o(),
    .INS_11_7_i(ID_EX.INS_11_7_o)
);

MEM_WB MEM_WB(
    .RegWrite_o(),
    .RegWrite_i(EX_MEM.RegWrite_o),
    .MemToReg_o(),
    .MemToReg_i(EX_MEM.MemToReg_o),
    .ALUresult_o(),
    .ALUresult_i(EX_MEM.ALUresult_o),
    .Readdata_o(),
    .Readdata_i(Data_Memory.data_o),
    .INS_11_7_o(),
    .INS_11_7_i(EX_MEM.INS_11_7_o)
);

endmodule

