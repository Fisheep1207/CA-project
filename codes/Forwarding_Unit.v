module Forwarding_Unit(
    Rs1_i,
    Rs2_i,
    WB_Rd_i,
    WB_RegWrite_i,
    MEM_Rd_i,
    MEM_RegWrite_i,
    ForwardA_o,
    ForwardB_o
);

input [4:0] Rs1_i, Rs2_i, WB_Rd_i, MEM_Rd_i;
input WB_RegWrite_i, MEM_RegWrite_i;
output reg [1:0] ForwardA_o, ForwardB_o;

always@(Rs1_i, Rs2_i, WB_Rd_i, MEM_Rd_i, WB_RegWrite_i, MEM_RegWrite_i)
    begin
        ForwardA_o = 2'b00;
        ForwardB_o = 2'b00;
        if (MEM_RegWrite_i && MEM_Rd_i != 0 && MEM_Rd_i == Rs1_i) ForwardA_o = 2'b10;
        else if (WB_RegWrite_i && WB_Rd_i != 0 && WB_Rd_i == Rs1_i) ForwardA_o = 2'b01;
        else ForwardA_o = 2'b00;
        
        if (MEM_RegWrite_i && MEM_Rd_i != 0 && MEM_Rd_i == Rs2_i) ForwardB_o = 2'b10;
        else if (WB_RegWrite_i && WB_Rd_i != 0 && WB_Rd_i == Rs2_i) ForwardB_o = 2'b01;
        else ForwardB_o = 2'b00;

        
    end

endmodule