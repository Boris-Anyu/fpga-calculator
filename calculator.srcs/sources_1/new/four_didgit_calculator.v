`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: St. Cloud State University
// Author: Boris Anyu
// 
// Create Date: 10/10/2026 02:03:01 PM
// Module Name: four_digit_calculator
// Project Name: ECE 320 Project 1, Part 1
// Target Devices: Nexys A7
// Description: Moore FSM for entering up to 4 digits like a calculator.
//              Extra digits are ignored once 4 are entered.
//////////////////////////////////////////////////////////////////////////////////


module four_digit_calculator(digit_in, clock, reset, Y4, Y3, Y2, Y1, Y0);

    //Inputs
    input [3:0] digit_in;
    input clock;
    input reset;
    
    //Outputs
    output reg [3:0] Y4;
    output reg [3:0] Y3;
    output reg [3:0] Y2;
    output reg [3:0] Y1;
    output reg [3:0] Y0;
    
    //Registers
    reg [3:0] thousands, hundreds, tens, ones;
    reg sign;
    reg [2:0] present_state, next;
    
    
    //Parameters: State encodes
    parameter S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b100, BLANK=4'hE;
    
    //Initialization (at FPGA programming time)
    initial begin
        thousands = 0;
        hundreds  = 0;
        tens      = 0;
        ones      = 0;
        sign      = 0;
        present_state = S0;
    end
    
    //Next State logic
    always @(present_state, digit_in)
        begin
            case(present_state)
                S0: if (digit_in <=4'd9 && digit_in >=4'd1)
                         next = S1;
                    else 
                         next = S0;
                        
                S1: if (digit_in <=4'd9 && digit_in >=4'd0)
                         next = S2;
                    else 
                            next = S1;     
                       
                                   
               
                S2: if (digit_in <=4'd9 && digit_in >=4'd0) 
                         next = S3;         
                    else 
                         next = S2;                         
                                                               
                S3: if (digit_in <=4'd9 && digit_in >=4'd0) 
                         next = S4;        
                    else 
                         next = S3;                         
                      
                S4:    if (digit_in <=4'd9 && digit_in >=4'd0) 
                         next = S4;
                       else 
                         next = S4;  
               
                                

                default: next = S0;
                
            endcase  
        end   
          
    //state transition     
    always @(posedge clock or posedge reset)
        begin
            if (reset) 
                present_state <= S0;
            else
                present_state <= next;
        end
        
    //Register Transfer Operation
    always @(posedge clock or posedge reset) 
        begin
            if (reset) 
                begin
                    thousands <= 0;
                    hundreds  <= 0;
                    tens      <= 0;
                    ones      <= 0;
                    sign      <= 0;
                end
               
        else begin
            case(present_state)
                S0: if (digit_in <=4'd9 && digit_in >=4'd0)
                        begin
                            thousands<=0; 
                            hundreds<=0; 
                            tens<=0; 
                            ones<=digit_in;
                        end 
                     
                
                S1: if (digit_in <=4'd9 && digit_in >=4'd0)
                        begin                              
                            thousands<=0;                    
                            hundreds<=0;                    
                            tens<=ones;                        
                            ones<=digit_in; 
                        end     
                        
                     else if (digit_in == 15)
                            begin
                                sign <= ~sign;
                            end      
                
                S2: if (digit_in <=4'd9 && digit_in >=4'd0)     
                        begin                                   
                            thousands<=0;                        
                            hundreds<=tens;                        
                            tens<=ones;                            
                            ones<=digit_in;                    
                        end    
                        
                    else if (digit_in == 15)
                            begin
                                sign <= ~sign;
                            end                                 
                                                             
                S3: if (digit_in <=4'd9 && digit_in >=4'd0)     
                        begin                                   
                            thousands<=hundreds;                        
                            hundreds<=tens;                        
                            tens<=ones;                            
                            ones<=digit_in;                    
                        end  
                     else if (digit_in == 15)
                            begin
                                sign <= ~sign;
                            end                                   
                
                S4: if (digit_in == 15)
                            begin
                                sign <= ~sign;
                            end    
                     
                  
                    
             endcase 
             end
             end
             

                // Output logic
            always @(*) begin
                   
                        case(present_state)
                             
                          
                             
                                S0: if (sign == 0) begin Y4 = BLANK; Y3 = BLANK; Y2 = BLANK; Y1 = BLANK; Y0 = ones; end
                                    else begin Y4 = BLANK; Y3 = BLANK; Y2 = BLANK; Y1 = BLANK; Y0 = ones; end
                                    
                                S1: if (sign == 0) begin Y4 = BLANK; Y3 = BLANK; Y2 = BLANK; Y1 = BLANK; Y0 = ones; end
                                    else begin Y4 = BLANK; Y3 = BLANK; Y2 = BLANK; Y1 = 15; Y0 = ones; end    
                                
                                S2: if (sign == 0) begin Y4 = BLANK; Y3 = BLANK; Y2 = BLANK; Y1 = tens; Y0 = ones; end
                                    else begin Y4 = BLANK; Y3 = BLANK; Y2 = 15; Y1 = tens; Y0 = ones; end
                                
                                S3: if (sign == 0) begin Y4 = BLANK; Y3 = BLANK; Y2 = hundreds; Y1 = tens; Y0 = ones; end
                                    else begin Y4 = BLANK; Y3 = 15; Y2 = hundreds; Y1 = tens; Y0 = ones; end   
                                
                                S4: if (sign == 0) begin Y4 = BLANK; Y3 = thousands; Y2 = hundreds;Y1 = tens; Y0 = ones; end
                                    else begin Y4 = 15; Y3 = thousands; Y2 = hundreds;Y1 = tens; Y0 = ones; end  
                                    
                                default: begin Y4 = BLANK; Y3 = BLANK; Y2 = BLANK; Y1 = BLANK; Y0 = ones; end
                                       
                                   
            
                         endcase
                         end
                              
                                                                                                                                
            endmodule
            
            
            
            
            
            
            
