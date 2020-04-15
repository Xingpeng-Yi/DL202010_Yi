`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/09 15:57:46
// Design Name: 
// Module Name: sseg4_TDM
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


module sseg4_TDM(
    input [15:0] data,
    input hex_dec,
    input sign,
    input reset,
    input clock,
    output [6:0] seg,
    output [3:0] an,
    output dp
    );
    wire [15:0] bcd_o, mux2_1;
    wire [3:0] mux4_o;
    wire [6:0] sseg_1;
    wire[1:0] digit_sel;
    reg [6:0] mux2_in1;
    wire [1:0] tick;
    wire and1;
    
    assign dp = 1;
    assign mux2_in1 = 7'b0111111;
    counter #(.N(18)) timer(.clk(clock), .en(1), .rst(reset), .tick(tick), .count());
    
    counter #(.N(2)) counter2(.clk(clock), .en(tick), .rst(reset), .tick(), .count(digit_sel));
    
    bcd11 bcd(.B11(data[10:0]), .O11(bcd_o));
    mux2 #(.N(16)) mux1(.hex_dec(hex_dec), .in1(bcd_o), .in0(data), .out(mux2_1));
    mux4 #(.N(4)) mux4_1(.in3(mux2_1[15:12]), .in2(mux2_1[11:8]), .in1(mux2_1[7:4]), .in0(mux2_1[3:0]), .digit_sel(digit_sel), .out(mux4_o));
    sseg_decoder Sd (.num(mux4_o), .sseg(sseg_1));
    AnodeDec Ad(.in(digit_sel), .out(an));
    assign and1 = sign && (~an[3]);
    mux2 #(.N(7)) mux2_2(.hex_dec(and1), .in1(mux2_in1), .in0(sseg_1),.out(seg));
    
    
endmodule
