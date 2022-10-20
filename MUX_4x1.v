`timescale 1ns / 1ps

module MUX_4x1(
    input [3:0] i_1_value, i_10_value, i_100_value, i_1000_value, 
    input [1:0] Sel,
    output [3:0] o_value
    );

    reg [3:0] r_value;
    assign o_value = r_value;

    always @(*) begin
        case (Sel)
            2'b00 : r_value = i_1_value;
            2'b01 : r_value = i_10_value;
            2'b10 : r_value = i_100_value;
            2'b11 : r_value = i_1000_value;
        endcase
    end
endmodule
