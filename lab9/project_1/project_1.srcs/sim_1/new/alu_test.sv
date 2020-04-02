module alu_test();
    reg[7:0] in0;
    reg[7:0] in1;
    reg[3:0] op;
    wire[7:0] out;
    
    alu #(.N(8)) a1(.in0(in0),.in1(in1),.op(op),.out(out));
    
    initial begin
        op = 0; in0 = 0; in1 = 1;#10;
        op = 1; in0 = 1; in1 = 0; #10;
        op = 2; in0 = 0; in1 = 0; #10;
        op = 3; in0 = 0; in1 = 1; #10;
        op = 4; in0 = 1; in1 = 1; #10;
        $finish;
        end

endmodule