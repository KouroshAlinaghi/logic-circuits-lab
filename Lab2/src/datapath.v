`timescale 1ns/1ns
module Datapath(
    clk, clkEn, rst, SerIn, sh_en, sh_enD, Cnt1, Cnt2, CntD, ldCntD, rst_cu,
    Co1, Co2, CoD, p0, p1, p2, p3, SSDOut
);
    input clk, clkEn, rst, SerIn, sh_en, sh_enD, Cnt1, Cnt2, CntD, ldCntD, rst_cu;
    output Co1, Co2, CoD, p0, p1, p2, p3;
    output [6:0] SSDOut;
    
    wire [1:0] port_num;
    wire serOut, rst_cu;
    wire [3:0] NumData;
    wire [3:0] Count;

    assign serOut = SerIn;

    ShiftReg2 partition_shr(SerIn, sh_en, clk, rst, clkEn, rst_cu, port_num);
    ShiftReg4 DataNum_shr(SerIn, sh_enD, clk, rst, clkEn, rst_cu, NumData);

    UpCounter1 port_cnt(Cnt1, clk, rst, clkEn, rst_cu, Co1);
    UpCounter2 DataNum_cnt(Cnt2, clk, rst, clkEn, rst_cu, Co2);

    DownCounter4 DataTrans_cnt(CntD, ldCntD, clk, rst, clkEn, NumData, rst_cu, CoD, Count);

    SSD sevenSegment(Count, SSDOut);

    assign {p0, p1, p2, p3} = (port_num == 2'b00) ? {serOut, 1'b0, 1'b0, 1'b0}
                            : (port_num == 2'b01) ? {1'b0, serOut, 1'b0, 1'b0}
                            : (port_num == 2'b10) ? {1'b0, 1'b0, serOut, 1'b0}
                            : {1'b0, 1'b0, 1'b0, serOut};
endmodule