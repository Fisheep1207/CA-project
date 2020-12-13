module Hazard_Detection_Unit(
    MemRead_i,
    INS_11_7_i,
    RD1addr_i,
    RD2addr_i,
    PCWrite_o,
    Stall_o,
    No_op_o
);

input  MemRead_i;
input  [4:0] INS_11_7_i;
input  [4:0] RD1addr_i, RD2addr_i;
output reg PCWrite_o;
output reg Stall_o;
output reg  No_op_o;

endmodule
