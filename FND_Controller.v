`timescale 1ns / 1ps

module FND_Controller(
    input i_clk,
    input i_reset,
    input [13:0] i_value,
    input i_OnOffSW,
    input i_ClearBTN,
    output [3:0] o_FND_Digit,
    output [7:0] o_FND_Font
    );

    // Digit Part
    wire w_1KHz_clk;
    ClockDivider U0(
        .i_clk(i_clk),
        .i_reset(i_reset),
        .o_clk(w_1KHz_clk)
    );

    wire [1:0] w_digitSelect;
    Counter U1(
        .i_clk(w_1KHz_clk),
        .i_reset(i_reset),
        .o_counter(w_digitSelect)
    );

    
    Decoder_2x4 U2(
        .OnOffSW(i_OnOffSW),
        .i_x(w_digitSelect),
        .o_y(o_FND_Digit)
    );

    wire [3:0] w_1_value, w_10_value, w_100_value, w_1000_value;
    digitDivider U3(
        .i_value(i_value),
        .i_clear(i_ClearBTN),
        .o_1_value(w_1_value), 
        .o_10_value(w_10_value), 
        .o_100_value(w_100_value), 
        .o_1000_value(w_1000_value)  
    );

    wire [3:0] w_fnd_value;
    MUX_4x1 U4(
        .i_1_value(w_1_value), 
        .i_10_value(w_10_value), 
        .i_100_value(w_100_value), 
        .i_1000_value(w_1000_value), 
        .Sel(w_digitSelect),
        .o_value(w_fnd_value)
    );

    BCDtoFND_Decoder U5(
        .i_value(w_fnd_value),
        .o_font(o_FND_Font)
    );

endmodule
