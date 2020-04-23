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
    integer i;
    
    guess_FSM  gf (.clk(clk), .rst(reset), .b(b_t), .y(out),.win(win),.lose(lose));
        
    always begin
        #5 clk = ~clk;
    end
    
    initial begin
        clk=0; reset=0; b_t = 4'b0001; #5;
        reset=1; #10;
        reset=0; #5;
        // bounce
        for (i=0; i<10; i=i+1) begin
            #20 b_t =~b_t;
        end
        // hold input = 1 for a while
        b_t = 4'b0010;
        reset = 1;
        // bounce
        for (i=0; i<10; i=i+1) begin
            #20 b_t=~b_t;
        end
        reset = 1;
        b_t = 4'b0100;
        // bounce
        for (i=0; i<10; i=i+1) begin
            #20 b_t=~b_t;
        end
        b_t = 4'b1000;
        // bounce
        for (i=0; i<10; i=i+1) begin
            #20 b_t=~b_t;
        end
        
        $finish;
    end
endmodule
