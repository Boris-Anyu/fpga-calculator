`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Boris Anyu
// Course: ECE 320 - Digital Circuits Design
// Lab Project:  Lab #4 - Sequence Recognizers (Moore FSM)
// Description:  Behavioral code converter circuit converting a 4-bit unsigned
//               binary input (0-15) to drive an active-low 7-segment display.
//////////////////////////////////////////////////////////////////////////////////



`timescale 1ns / 1ps

module seg7_decoder (
    input  wire [3:0] A,
    output reg  [1:7] X
);

    always @(*) begin
        case (A)
            4'd0:    X = 7'b0000001;
            4'd1:    X = 7'b1001111;
            4'd2:    X = 7'b0010010;
            4'd3:    X = 7'b0000110;
            4'd4:    X = 7'b1001100;
            4'd5:    X = 7'b0100100;
            4'd6:    X = 7'b0100000;
            4'd7:    X = 7'b0001111;
            4'd8:    X = 7'b0000000;
            4'd9:    X = 7'b0000100;
            default: X = 7'b1111111;
        endcase
    end

endmodule