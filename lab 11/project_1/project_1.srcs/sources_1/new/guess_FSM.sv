`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/23 11:09:12
// Design Name: 
// Module Name: guess_FSM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module guess_FSM(
    input [3:0] b,
    input clk, rst,
    output reg [3:0] y,
    output reg win, lose
    );
    reg [1:0] s, s_next;
    localparam [1:0]
      s0  = 2'b00,
      s1  = 2'b01,
      s2  = 2'b10,
      s3  = 2'b11;
    
    always_ff @(posedge clk or posedge rst)
      if (rst) begin
         s  <= s0;
         
      end
      else begin
         s  <= s_next;
         
      end
    always_comb begin
      s_next = s0;
      win = 0;
      lose = 0;
      y = 4'b0000;
   
    case(s)
      s0: begin
      y[0] = 1;
      if(~b[3]&~b[2]&~b[1]&b[0])
        win = 1;        
      else if(b[3]|b[2]|b[1])
        lose = 1;         
      else
        s_next = s1;
      end
        
      s1: begin
      y[1] = 1;
      if(~b[3]&~b[2]&b[1]&~b[0])
        win = 1;        
      else if(b[3]|b[2]|b[0])
        lose = 1;        
      else
        s_next = s2;
        
      end
      
      s2: begin
      y[2] = 1;
      if(~b[3]&b[2]&~b[1]&~b[0])
        win = 1;        
      else if(b[3]|b[0]|b[1])
        lose = 1;        
      else
        s_next = s3;
        
      end
      
      s3: begin
      y[3] = 1;
      if(b[3]&~b[2]&~b[1]&~b[0])
        win = 1;        
      else if(b[0]|b[2]|b[1])
        lose = 1;        
      else
        s_next = s0;
       
      end
      endcase
      end
endmodule
