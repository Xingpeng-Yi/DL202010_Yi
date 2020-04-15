`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/09 14:58:15
// Design Name: 
// Module Name: counter_test
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


module counter_test(

    );
    reg clk, en,rst;
    wire [3:0] count;
    wire tick;
    
    counter #(.N(4)) c (.clk(clk), .rst(rst), .en(en), .count(count), .tick(tick));
    
    always begin
        clk = ~clk; #5;
    end
    
    initial begin
        clk = 0; en = 0; rst = 0; #7;
        rst = 1;en = 1;#3;
        rst = 0; #10;
        en = 1; #10;
        en = 0; #10;
        en = 1; #10;
        en = 0;#10;
        en = 1; #10;
        en = 0;  #10;
        $finish;
        end
        
endmodule
