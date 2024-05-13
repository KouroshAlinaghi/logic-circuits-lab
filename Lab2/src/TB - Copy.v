`timescale 1ns/1ns

module Exp2TB;
    reg SerIn = 0;
    reg clkPB = 0;
    reg clk = 0;
    reg rst = 0;
    wire p0, p1, p2, p3, done, serOutValid;
    wire [6:0] ssd;

    TopLevel UUT1(SerIn, clkPB, clk, rst, p0, p1, p2, p3, done, serOutValid, ssd);

	initial begin
    	repeat (800) #(5) begin
            clk = ~clk;
        end
  	end

    initial begin
        repeat (400) begin
            #1;
            clkPB = 1;
            #12;
            clkPB = 0;
            #1;
        end
    end

  	initial begin
        #6
        repeat (400) #(7) begin
            SerIn = $random();
        end


	    $stop;
  	end
endmodule