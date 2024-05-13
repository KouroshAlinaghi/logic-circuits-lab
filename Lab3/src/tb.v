`timescale 1ns/1ns
module tb();
    reg clk = 0;
    reg rst = 0;
    reg ld = 0;
    reg [9:0] sw = {3'b000, 2'b00, 5'b11111};
    wire [7:0] po;
    wire pwmOut;

    Everything DUT(clk, rst, ld, sw, po, pwm_out);

    always #20 clk = ~clk;

    initial begin
        #100;
        ld = 1;
        #100;
        ld = 0;

        sw = {3'b010, 2'b00, 5'b11111};
        #500000

        $stop;
    end

endmodule
