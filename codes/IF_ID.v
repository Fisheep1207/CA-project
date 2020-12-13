module IF_ID
(
    clk_i,
    IF_ID_i,
    Flush_i,
    Stall_i,
    PC_i,
    IF_ID_o,
    PC_o,
);

input clk_i;
input [31:0] IF_ID_i;
input Stall_i;
input Flush_i;
input [31:0] PC_i;
output reg [31:0] PC_o;
output reg [31:0] IF_ID_o;

always@(posedge clk_i)  begin
  if(!Stall_i) begin
    IF_ID_o = (Flush_i)? 32'b0: IF_ID_i;
    PC_o = PC_i;
  end
end

endmodule
