`define I_TYPE 7'b0010011
`define R_TYPE 7'b0110011

module Control(
    Op_i,       //   (Ins[6:0]),
    ALUOp_o,    //   (ALUOp[1:0]),
    ALUSrc_o,   //   (ALUSrc),
    RegWrite_o  //   (Control_to_Reg)
);
input   [6:0]   Op_i;
output  [1:0]   ALUOp_o;
output          ALUSrc_o;
output          RegWrite_o;
reg [1:0] a;
reg b, c;
always@(Op_i) begin
    if (Op_i == `I_TYPE) begin
        a = 2'b01;
        b = 1;
        c = 1;
    end 
    else if (Op_i == `R_TYPE) begin
        a = 2'b00; 
        b = 0;
        c = 1;
    end
end
assign ALUOp_o     =   a;
assign ALUSrc_o    =   b;
assign RegWrite_o  =   c;
endmodule 
