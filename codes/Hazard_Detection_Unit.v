module Hazard_Detection_Unit(
    MemRead_i,
    INS_11_7_i,
    RD1addr_i,
    RD2addr_i,
    PCWrite_o,
    Stall_o,
    No_op_o
);

input reg MemRead_i;
input reg [4:0] INS_11_7_i;
input reg [5:0] RD1addr_i, RD2addr_i;
output PCWrite_o;
output Stall_o;
output [6:0] No_op_o;

endmodule
