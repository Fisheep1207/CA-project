module IF_ID
(
    IF_ID_i,
    IF_ID_o
);

input [31:0] IF_ID_i;
output reg [31:0] IF_ID_o;

always@(IF_ID_i)  begin
  IF_ID_o <= IF_ID_i;  
end

endmodule