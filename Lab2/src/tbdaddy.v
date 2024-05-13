


`timescale 1ns/1ns
module tb();
    reg clk = 0;
    reg serIn, rst, clkPb;
    wire p0,p1,p2,p3,done, seroutvalid;
    wire[6:0] ssd;

    final_MSSD DUT (serIn, clk, rst, clkPb, p0,p1,p2,p3,done, seroutvalid, ssd);

    always #50 clk = ~clk;

    initial begin
        #500 clkPb = 1;
        serIn=1;
        #500 clkPb = 0;
        #500 clkPb = 1;
        serIn =0;
        #500 clkPb = 0;
        #500 clkPb = 1;
        serIn = 1;
        #500 clkPb = 0;
        #500 clkPb = 1;
        serIn = 0;
        #500 clkPb = 0;
        #500 clkPb = 1;
        serIn =1;
        #500 clkPb = 0;
        #500 clkPb = 1;
        serIn = 1;
        #500 clkPb = 0;
        #500 clkPb = 1;
        serIn = 0;
        #500 clkPb = 0;
        #500 clkPb = 1;
        serIn = 1;
        #500 clkPb = 0;
        #500 clkPb = 1;
        serIn = 0;
        #500 clkPb = 0;
        #500 clkPb = 1;
        #500 clkPb = 0;
        #500 clkPb = 1;
        #500 clkPb = 0;
        #500 clkPb = 1;
        #500 clkPb = 0;
        #500 clkPb = 1;
        #500 clkPb = 0;
        #500 clkPb = 1;
        #500 clkPb = 0;
        #500 clkPb = 1;
        #500 clkPb = 0;
        #500 clkPb = 1;
        #500 clkPb = 0;
        #500 clkPb = 1;
        #500 clkPb = 0;
        #500 clkPb = 1;
        #500 clkPb = 0;
        #500 clkPb = 1;
        #500 clkPb = 0;
        #500 clkPb = 1;
        #500 clkPb = 0;
        #500 clkPb = 1;
        #500 clkPb = 0;
        #500 clkPb = 1;
        #500 clkPb = 0;
        #500 clkPb = 1;
        #10000;
        $stop;
    end

endmodule
