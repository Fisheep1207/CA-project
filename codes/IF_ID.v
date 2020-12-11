module IF_ID
(
    clk_i,
    IF_ID_i,
    IF_ID_o
);
input               clk_i;
input [31:0] IF_ID_i;
output reg [31:0] IF_ID_o;

always@(clk_i)  begin
  IF_ID_o <= IF_ID_i;  
end

endmodule