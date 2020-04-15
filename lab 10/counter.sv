`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/09 14:44:36
// Design Name: 
// Module Name: counter
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


module counter #(parameter N=1)
    (
    input clk, rst, en,
    output [N-1:0] count,
    output tick
    );
    
    reg [N-1:0] Q_reg, Q_next;
    
    always @(posedge clk, posedge rst)
    begin
        if(rst)
            Q_reg <= 0;
        else
            Q_reg <= Q_next;
    end
    
    always @*
    begin
        if(en)
            Q_next = Q_reg + 1'b1;
        else
            Q_next = Q_reg;
    end
    
    assign count = Q_reg;
    assign tick = (Q_reg == {N{1'b1}}) ? 1'b1 : 1'b0;
    
    
    
endmodule
