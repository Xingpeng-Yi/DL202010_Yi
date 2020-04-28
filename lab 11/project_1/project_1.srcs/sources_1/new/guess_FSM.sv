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
    reg [3:0] s, s_next;
    localparam [3:0]
        s0 = 4'b0000,
        s1 = 4'b0001,
        s2 = 4'b0010,
        s3 = 4'b0011,
        swin = 4'b0101,
        slose = 4'b0110;
     
        
    always_ff @(posedge clk or posedge rst)
      if (rst) begin
         s  <= s0;
         
      end
      else begin
         s  <= s_next;
         
      end
    always_comb begin
      s_next = s;
      
   
    case(s)
      s0: begin
      y = 4'b0001;
      win  = 0;
      lose = 0;
      if(b == 4'b0000)
         s_next = s1;
      else if(b == 4'b0001)
        s_next = swin;   
      else if(b!= 4'b0001)
        s_next = slose;        
      end
        
      s1: begin
      y = 4'b0010;
      win  = 0;
      lose = 0;
      if(b == 4'b0000)
        s_next = s2;
      else if(b ==4'b0010)
        s_next = swin;        
      else if(b != 4'b0010)
       s_next = slose;       
        
      end
      
      s2: begin
      y= 4'b0100;
      win  = 0;
      lose = 0;
      if(b == 4'b0000)
        s_next = s3;
      else if(b ==4'b0100)
        s_next = swin;        
      else if(b[3]|b[1]|b[0])
        s_next = slose;               
      end
      
      s3: begin
      y = 4'b1000;
      win  = 0;
      lose = 0;
      if(b == 4'b0000)
        s_next = s0;
      else if(b ==4'b1000)
        s_next = swin;        
      else if(b[2]|b[1]|b[0])
        s_next = slose;        
      end
      
      swin: begin
      win = 1;
      
      if(b == 4'b0000)
      s_next = s0;
      end
      
      slose: begin
      lose = 1;
      if(b == 4'b0000)
      s_next = 0;
      end
      
      endcase
      end
endmodule
