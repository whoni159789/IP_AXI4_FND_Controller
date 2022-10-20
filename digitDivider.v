`timescale 1ns / 1ps

module digitDivider(
    input [13:0] i_value,
    input i_clear,
    output [3:0] o_1_value, o_10_value, o_100_value, o_1000_value  
    );

    reg [3:0] r_1_value, r_10_value, r_100_value, r_1000_value;
    assign o_1_value    = r_1_value;
    assign o_10_value   = r_10_value;
    assign o_100_value  = r_100_value;
    assign o_1000_value = r_1000_value;

    always @(*) begin
        if(i_clear) begin
            r_1_value    = 0;
            r_10_value   = 0;
            r_100_value  = 0;
            r_1000_value = 0;
        end
        else begin
            r_1_value    = i_value % 10;
            r_10_value   = i_value / 10 % 10;
            r_100_value  = i_value / 100 % 10;
            r_1000_value = i_value / 1000 % 10;
        end
    end
endmodule
