`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/28 03:02:11
// Design Name: 
// Module Name: guessing_game
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


module guessing_game(
    input clk,btnC,btnL,btnR,btnD,btnU,
    input [15:0] sw,
    output reg [15:0] led,
    output reg [3:0] an,
    output reg [6:0] seg,
    output dp
    );
    wire [3:0] de_w;
    wire in1_w,out_w;
    reg [3:0] y;
    reg win, lose;
    counter #(.N(1)) c(.clk(clk),.rst(btnC),.en(1),.count(in1_w),.tick());
    
    debounce #(.N(1)) d1(.clk(clk),.reset(btnC),.in(btnR),.out(de_w[0]),.tick());
    debounce #(.N(1)) d2(.clk(clk),.reset(btnC),.in(btnU),.out(de_w[1]),.tick());
    debounce #(.N(1)) d3(.clk(clk),.reset(btnC),.in(btnL),.out(de_w[2]),.tick());
    debounce #(.N(1)) d4(.clk(clk),.reset(btnC),.in(btnD),.out(de_w[3]),.tick());
    
    mux2 #(.N(1)) m2(.hex_dec(sw[0]),.in0(clk),.in1(in1_w),.out(out_w));
    
    guess_FSM gF(.b(de_w),.clk(out_w),.y(y),.win(win),.lose(lose));
    
    assign seg[0] = 1;
    assign seg[3] = 1;
    assign seg[6] = 1;
    assign seg[1] = y[0];
    assign seg[2] = y[1];
    assign seg[4] = y[2];
    assign seg[5] = y[3];
    assign led[8] = win;
    assign led[10] =lose;
    assign an = 4'b1110;
    assign dp = 1;
    
endmodule
