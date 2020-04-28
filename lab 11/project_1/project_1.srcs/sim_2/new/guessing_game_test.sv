module guessing_game_test();
reg [15:0] sw;
reg btnC, btnR, btnL, btnD, btnU;
reg clk;
wire [15:0] led;
wire [3:0] an;
wire [6:0] seg;
wire dp;

guessing_game gg(.sw(sw),.btnC(btnC),.btnR(btnR),.btnL(btnL),.btnU(btnU),.btnD(btnD),.clk(clk),.led(led),.an(an),.seg(seg),.dp(dp));

always begin
        #5 clk = ~clk;
    end
    
    initial begin
    sw = 0;
    btnC = 0; btnU = 1; btnL = 0; btnR = 0; btnD = 0; #5;
    sw = 0;
    btnC = 1;#5;
    
    sw = 0;
    btnC = 0; btnU = 0; btnL = 0; btnR = 0; btnD = 0; #5;
    sw = 0;
    btnC = 0; btnU = 0; btnL = 0; btnR = 0; btnD = 0; #5;
    sw = 0;
    btnC = 0; btnU = 0; btnL = 0; btnR = 0; btnD = 0; #5;
    sw = 0;
    btnC = 0; btnU = 1; btnL = 0; btnR = 0; btnD = 0; #5;

    $finish;
    end

endmodule