`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: St. Cloud State University
// Author: Boris Anyu
// 
// Create Date: 10/11/2026 05:36:08 PM
// Module Name: calculator_TB
// Project Name: ECE 320 Project 1, Part 1
// Description: Testbench for four_digit_calculator.
//////////////////////////////////////////////////////////////////////////////////


module calculator_TB();

    reg [3:0] digit_in;
    reg clock, reset;
    wire [3:0] Y3, Y2, Y1, Y0;
    
    four_digit_calculator uut(
            .digit_in(digit_in),
            .clock(clock),
            .reset(reset),
            .Y3(Y3),
            .Y2(Y2),
            .Y1(Y1),
            .Y0(Y0)
            );
            
    initial begin
        clock = 0;
     end
     
     always begin
        #50 clock = ~clock;
        end 
        
     initial begin
        reset = 1;
        digit_in = 0;
        
        #125 reset = 0;
        
        digit_in=4'b0001; #100;
        digit_in=4'b0010; #100;
        digit_in=4'b0000; #100;
        digit_in=4'b0011; #100;
        digit_in=4'b0101; #100;
        
        reset = 1; #100;
        reset = 0; #25;
        
        digit_in=4'b0001; #100;
        digit_in=4'b0011; #100;
        digit_in=4'b0100; #100;
        digit_in=4'b0011; #100;
        digit_in=4'b0100; #100;
        
        reset = 1; #100;
        reset = 0; #25;
        
        digit_in=4'b0001; #100;
        digit_in=4'b0010; #100;
        digit_in=4'b0000; #100;
        digit_in=4'b0011; #100;
        digit_in=4'b0101; #100;
        
        reset = 1; #100;
        reset = 0; #25;
        
        digit_in=4'b0001; #100;
        digit_in=4'b0011; #100;
        digit_in=4'b0100; #100;
        digit_in=4'b0011; #100;
        digit_in=4'b0100; #100;
        
        #100;
        
        
        end
        
    




endmodule
