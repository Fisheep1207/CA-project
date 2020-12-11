`define AND_FUNC    10'b0000000111
`define XOR_FUNC    10'b0000000100
`define SLL_FUNC    10'b0000000001
`define ADD_FUNC    10'b0000000000
`define SUB_FUNC    10'b0100000000
`define MUL_FUNC    10'b0000001000
`define ADDI_FUNC   3'b000
`define SRAI_FUNC   3'b101
module ALU_Control(
    funct_i,    // ({Ins[31:25, 14:12]}),
    ALUOp_i,    // (ALUOp),
    ALUCtrl_o  // (ALUControl_to_ALU)
);
input   [9:0]   funct_i;
input   [1:0]   ALUOp_i;
output  reg [2:0]   ALUCtrl_o;
always@(funct_i, ALUOp_i) begin
    if (ALUOp_i == 2'b00) begin // R-type
        case(funct_i)
            `ADD_FUNC: ALUCtrl_o = 3'b000;
            `SUB_FUNC: ALUCtrl_o = 3'b001;
            `AND_FUNC: ALUCtrl_o = 3'b010;      
            `XOR_FUNC: ALUCtrl_o = 3'b011;
            `MUL_FUNC: ALUCtrl_o = 3'b100;   
            `SLL_FUNC: ALUCtrl_o = 3'b101;
        endcase
    end
    else if (ALUOp_i == 2'b01) begin            // I-type
        case(funct_i[2:0])
            3'b000:   ALUCtrl_o = 3'b000;
            3'b101:   ALUCtrl_o = 3'b110;
            3'b010:   ALUCtrl_o = 3'b000;       // load
        endcase
    end
    else if (ALUOp_i == 2'b10) begin            // S-type
        case(funct_i[2:0])
            3'b010:   ALUCtrl_o = 3'b000;     
        endcase
    end
    // else if (ALUOp_i == 2'b11) begin         // SB-type
    //     case(funct_i[2:0])
    //         3'b000:   ALUCtrl_o = 3'b000;
    //     endcase
    // end  
end
endmodule 