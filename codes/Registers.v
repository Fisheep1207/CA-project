module Registers
(
    clk_i,
    RD1addr_i,
    RD2addr_i,
    WRaddr_i, 
    WRdata_i,
    RegWrite_i, 
    RD1data_o, 
    RD2data_o 
);

// Ports
input               clk_i;
input   [4:0]       RD1addr_i;
input   [4:0]       RD2addr_i;
input   [4:0]       WRaddr_i; 
input   [31:0]      WRdata_i;
input               RegWrite_i;
output  [31:0]      RD1data_o; 
output  [31:0]      RD2data_o;

// Register File
reg signed    [31:0]      register        [0:31];

// Read Data      
assign  RD1data_o = (RD1addr_i == WRaddr_i && RegWrite_i)? WRdata_i : register[RD1addr_i];
assign  RD2data_o = (RD2addr_i == WRaddr_i && RegWrite_i)? WRdata_i : register[RD2addr_i];

// Write Data   
always@(posedge clk_i) begin
    if(RegWrite_i && WRaddr_i != 0)
        register[WRaddr_i] <= WRdata_i;
end


   
endmodule 
