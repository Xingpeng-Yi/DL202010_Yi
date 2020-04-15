`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/14 18:43:08
// Design Name: 
// Module Name: calc_lab10
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


module calc_lab10(
        input [15:0] sw,
        input clk, btnC, btnD, btnU,
        output reg [15:0] led,
        output [6:0] seg,
        output [3:0] an,
        output dp
    );
    reg [15:0] data;
    
    top_lab9 calc_unit(.sw(sw[11:0]), .clk(clk), .btnC(btnC), .btnD(btnD), .btnU(btnU),.led(led));
    
    assign data[7:0] = led[15:8];
    assign data[15:8] = 8'b00000000;
    
    sseg4_TDM disp_unit(.data(data),.hex_dec(sw[15]), .sign(sw[14]), .reset(btnC), .clock(clk),.seg(seg), .an(an), .dp(dp));
    
    
endmodule
