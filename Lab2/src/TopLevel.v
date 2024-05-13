`timescale 1ns/1ns

module TopLevel(
	SerIn, clkPB, clk, rst,
	p0, p1, p2, p3, done, serOutValid, ssd
);

	input SerIn, clkPB, clk, rst;
	output p0, p1, p2, p3, done, serOutValid;
	output [6:0] ssd;

	wire Co1, Co2, CoD;
	wire Cnt1, Cnt2, CntD, ldCntD, sh_en, sh_enD, rst_cu;
	wire clkEn;

	Controller controller(
		clk, rst, SerIn, clkEn, Co1, Co2, CoD,
		Cnt1, Cnt2, CntD, ldCntD, sh_en, sh_enD, serOutValid, done, rst_cu
	);


	Datapath DP(
    	clk, clkEn, rst, SerIn, sh_en, sh_enD, Cnt1, Cnt2, CntD, ldCntD, rst_cu,
    	Co1, Co2, CoD, p0, p1, p2, p3, ssd
    );

    OnePulser OP(
    	clkPB, clk, rst,
    	clkEn
    );

endmodule