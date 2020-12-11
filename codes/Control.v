`define I_TYPE 7'b0010011
`define R_TYPE 7'b0110011
`define LOAD 7'b0000011
`define STORE 7'b0100011
`define BRANCH 7'b1100011
module Control(
    Op_i,       //   (Ins[6:0]),
    ALUOp_o,    //   (ALUOp[1:0]),
    ALUSrc_o,   //   (ALUSrc),
    RegWrite_o,  //   (Control_to_Reg)
    MemToReg_o,
    MemRead_o,
    MemWrite_o
);
input      [6:0]   Op_i;
output  reg[1:0]   ALUOp_o;
output  reg        ALUSrc_o;
output  reg        RegWrite_o; 
output  reg        MemRead_o;
output  reg        MemWrite_o;
output  reg        MemToReg_o;
always@(Op_i) begin
    if (Op_i == `R_TYPE) begin
        ALUOp_o     =   2'b00;  //  R type
        ALUSrc_o    =   1'b0;
        RegWrite_o  =   1'b1;      //  Write Register
        MemRead_o   =   1'b0;
        MemWrite_o  =   1'b0;
        MemToReg_o  =   1'b0;
    end
    else if (Op_i == `I_TYPE) begin
        ALUOp_o     =   2'b01;  //  I type
        ALUSrc_o    =   1'b1;      //  Mux Choose Immediate
        RegWrite_o  =   1'b1;      //  Write Register
        MemRead_o   =   1'b0;
        MemWrite_o  =   1'b0;
        MemToReg_o  =   1'b0;
    end 
    else if (Op_i == `LOAD) begin
        ALUOp_o     =   2'b01;  //  I type
        ALUSrc_o    =   1'b1;      //  Mux Choose Immediate
        RegWrite_o  =   1'b1;      //  Write Register
        MemRead_o   =   1'b1;      //  Read Memory
        MemWrite_o  =   1'b0;      
        MemToReg_o  =   1'b1;      //  Read From Memory
    end
    else if (Op_i == `STORE) begin
        ALUOp_o     =   2'b10;  //  S-type (Store)
        ALUSrc_o    =   1'b1;      //  Mux Choose Immediate
        RegWrite_o  =   1'b0;      //  Write Register
        MemRead_o   =   1'b0;
        MemWrite_o  =   1'b1;      //  Write to Memory
        MemToReg_o  =   1'b0;
    end
    // else if (Op_i == `BRANCH) begin
    //     ALUOp_o     =   2'b11;  //  SB-type (Beq)
    //     ALUSrc_o    =   1'b0;      //  Mux Choose Register
    //     RegWrite_o  =   1'b0;
    //     MemRead_o   =   1'b0;
    //     MemWrite_o  =   1'b0;
    //     MemToReg_o  =   1'b0;
    // end
end
endmodule 
