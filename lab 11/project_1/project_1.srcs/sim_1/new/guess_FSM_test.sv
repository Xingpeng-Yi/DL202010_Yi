`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/23 12:13:29
// Design Name: 
// Module Name: guess_FSM_test
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


module guess_FSM_test( );
    reg clk, reset;
    reg [3:0] b_t;
    wire [3:0] out;
    wire win,lose;
    
    guess_FSM  gf (.clk(clk), .rst(reset), .b(b_t), .y(out),.win(win),.lose(lose));
        
    always begin
        #5 clk = ~clk;
    end
    
    initial begin
        
        clk=0; reset=0;#5;
        reset=1; #5;
        reset=0;#5;
        b_t = 4'b0000; #5;
        // bounce
        b_t = 4'b0001;#5;
        b_t = 4'b0000;#10;
        // hold input = 1 for a while
        b_t = 4'b0010;#5;
        b_t = 4'b0000;#10;
        
        b_t = 4'b0011;#5;
        
        // bounce
        b_t = 4'b0000;#15;
        
        b_t = 4'b0100;#5;
        b_t = 4'b0000;#15;
        
        b_t = 4'b0011;#5;
        // bounce
        b_t = 4'b0000;#20;
        b_t = 4'b1000;#5;
        b_t = 4'b0000;#15;
        b_t = 4'b0011;#5;
        // bounce
        
        
        $finish;
    end
endmodule
