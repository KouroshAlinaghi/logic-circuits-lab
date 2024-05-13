`timescale 1ns/1ns
module tb_dds();
    reg clk = 0;
    reg rst = 0;
    wire [7:0] po;

    DDSUnit DUT(clk, rst, po);

    always #20 clk = ~clk;

    initial begin
        #50000;

        $stop;
    end

endmodule
