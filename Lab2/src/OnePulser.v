`timescale 1ns/1ns

`define A 2'b00
`define B 2'b01
`define C 2'b10

module OnePulser(
    clkPB, clk, rst,
    clkEn
);
    input clkPB, clk, rst;
    output clkEn;

    reg [1:0] ps = `A, ns = `A;

    always @(posedge clk, posedge rst) begin
        ns = `A;
        case (ps)
            `A: ns = clkPB ? `B : `A;
            `B: ns = `C;
            `C: ns = clkPB ? `C : `A;
        endcase
    end

    assign clkEn = (ps == `B) ? 1'b1 : 1'b0;

    always @(posedge clk, posedge rst) begin
        if (rst)
            ps <= `A;
        else
            ps <= ns;
    end
endmodule