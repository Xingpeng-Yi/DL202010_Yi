module sseg_TDM_test();
    
    reg [15:0] data;
    reg hex_dec;
    reg sign;
    reg reset;
    reg clock;
    wire [6:0] seg;
    wire [3:0] an;
    wire dp;
    
    sseg4_TDM st(.data(data),.hex_dec(hex_dec),.sign(sign),.reset(reset),.clock(clock),.seg(seg),.an(an),.dp(dp));
    
    always begin
        clock = ~clock; #5;
    end
    
     initial begin
        clock = 0;
        data = 16'b0000000000000010;
        hex_dec = 0;
        sign = 0;
        reset = 0;
        #20;
        data = 16'b0000000000000001;
        hex_dec = 1;
        sign = 0;
        reset = 0;
        #40;
        data = 16'b0000000000000010;
        hex_dec = 0;
        sign = 0;
        reset = 0;
        #80;
        data = 16'b0000000000000010;
        hex_dec = 1;
        sign = 0;
        reset = 0;
        #160;
        data = 16'b0000000000000011;
        hex_dec = 0;
        sign = 0;
        reset = 1;
        #160;
        data = 16'b0000000000000011;
        hex_dec = 1;
        sign = 0;
        reset = 0;
        #320;
        data = 16'b0000000000000100;
        hex_dec = 0;
        sign = 0;
        reset = 0;
        #640;
        data = 16'b0000000000000100;
        hex_dec = 1;
        sign = 0;
        reset = 0;
        #1280;
        data = 16'b0000000000000101;
        hex_dec = 0;   
        sign = 0;
        reset = 0;
        #2560;
        data = 16'b0000000000000101;
        hex_dec = 1;
        sign = 0;
        reset = 0;
        #5120;
        data = 16'b0000000000000110;
        hex_dec = 0;
        sign = 0;
        reset = 0;
        #10240;
        data = 16'b0000000000000110;
        hex_dec = 1;
        sign = 0;
        reset = 0;
        #20480;
        data = 16'b0000000000000111;
        hex_dec = 0;
        sign = 0;
        reset = 0;
        #40960;
        $finish;
        end
    
    
    

endmodule