module MUX_4(
    input_00_i,
    input_01_i,
    input_10_i,
    input_11_i,
    select_i,
    data_o
);

input [31:0] input_00_i, input_01_i, input_10_i, input_11_i;
input [1:0] select_i;
output reg [31:0] data_o;

always@(select_i, input_00_i, input_01_i, input_10_i, input_11_i) begin
    case (select_i)
        2'b00: data_o <= input_00_i; 
        2'b01: data_o <= input_01_i;
        2'b10: data_o <= input_10_i;
        2'b11: data_o <= input_11_i;
        default: data_o = 0;
    endcase
end

endmodule
