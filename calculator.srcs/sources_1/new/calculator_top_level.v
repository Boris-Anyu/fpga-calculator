`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: St. Cloud State University
// Author: Boris Anyu
// 
// Create Date: 10/10/2026 04:24:28 PM
// Module Name: calculator_top_level
// Project Name: ECE 320 Project 1, Part 1
// Target Devices: Nexys A7
// Description: Top level. Connects the calculator to the seven-segment decoders
//              and the display driver.
//////////////////////////////////////////////////////////////////////////////////


module calculator_top_level(digit_in, clock, reset, CLK100MHz, seg, an);
        
        //inputs
        input [3:0]digit_in;
        input clock;
        input reset;
        input CLK100MHz;
        
        //output
        output [0:7]seg;
        output [7:0]an;
        
        //wire
        wire [3:0] Y3, Y2, Y1, Y0;
        wire [1:7] X3, X2, X1, X0;
        
        four_digit_calculator uut1(
            .digit_in(digit_in),
            .clock(clock),
            .reset(reset),
            .Y3(Y3),
            .Y2(Y2),
            .Y1(Y1),
            .Y0(Y0)
            );
        
        seg7_decoder uut2(
            .A(Y0),
            .X(X0)
            );
            
        seg7_decoder uut3(  
            .A(Y1),         
            .X(X1)
            );         
        
        seg7_decoder uut4(         
            .A(Y2),                
            .X(X2)                 
            );                     
                                   
        seg7_decoder uut5(         
            .A(Y3),                
            .X(X3)                
            );    
               
     sSegDisplay_8 uut6(         
             .ck(CLK100MHz),         
             .digit0(X0),          
             .digit1(X1),          
             .digit2(X2),         
             .digit3(X3),         
             .digit4(7'b111_1111),         
             .digit5(7'b111_1111),                    
             .digit6(7'b111_1111),        
             .digit7(7'b111_1111),         
             .seg(seg),       
             .an(an)
              );
                        
endmodule
