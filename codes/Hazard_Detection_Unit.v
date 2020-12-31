module Hazard_Detection_Unit(
    MemRead_i,
    INS_11_7_i,
    RS1addr_i,
    RS2addr_i,
    PCWrite_o,
    Stall_o,
    No_op_o
);

input  MemRead_i;
input  [4:0] INS_11_7_i;
input  [4:0] RS1addr_i, RS2addr_i;
output reg PCWrite_o;
output reg Stall_o;
output reg No_op_o;

always @(MemRead_i, RS1addr_i, RS2addr_i, INS_11_7_i) begin
    if(MemRead_i == 1'b1 && ((INS_11_7_i == RS1addr_i) || (INS_11_7_i == RS2addr_i))) begin
        Stall_o = 1'b1;
        No_op_o = 1'b1;
        PCWrite_o = 1'b0;
    end
    else begin
        Stall_o = 1'b0;
        No_op_o = 1'b0;
        PCWrite_o = 1'b1;
    end
end

endmodule
