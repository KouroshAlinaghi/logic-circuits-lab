`timescale 1ns/1ns

`define idle 3'b000
`define initialization 3'b001
`define readPortNum 3'b010
`define readDataNum 3'b011
`define downCountData 3'b100
`define bridgeState 3'b111

module Controller(
	clk, rst, SerIn, clkEn, Co1, Co2, CoD, 
	Cnt1, Cnt2, CntD, ldCntD, sh_en, sh_enD, serOutValid, done, rst_cu
	);

	input clk, rst, SerIn, clkEn, Co1, Co2, CoD;
	output Cnt1, Cnt2, CntD, ldCntD, sh_en, sh_enD, serOutValid, done, rst_cu;
    wire done;
	reg Cnt1, Cnt2, CntD, ldCntD, sh_en, sh_enD, serOutValid, rst_cu;
	
	reg [2:0] ps = `idle;
	reg [2:0] ns = `idle;
	
    always @(ps, SerIn, Co1, Co2, CoD) begin
        case (ps)
            `idle: ns = SerIn ? `idle : `readPortNum;
            `readPortNum: ns = Co1 ? `readDataNum : `readPortNum;
            `readDataNum: ns = Co2 ? `bridgeState : `readDataNum;
            `bridgeState: ns = `downCountData;
            `downCountData: ns = CoD ? `idle : `downCountData;
        endcase
    end

    assign done = (CoD == 1'b1) ? 1'b1 : 1'b0;

    always @(posedge clk, posedge rst) begin
		{Cnt1, Cnt2, CntD, ldCntD, sh_en, sh_enD, serOutValid, rst_cu} = 8'b0000_0000;

        case (ps)
            `idle: {rst_cu} = 1'b1;
            `readPortNum: {sh_en, Cnt1} = 2'b11;
            `readDataNum: {sh_enD, Cnt2} = 2'b11;
            `bridgeState: {ldCntD, serOutValid} = 2'b11;
            `downCountData: {CntD, serOutValid} = 2'b11;
            default: {Cnt1, Cnt2, CntD, ldCntD, sh_en, sh_enD, serOutValid, rst_cu} = 8'b0000_0000;
        endcase
    end

    always @(posedge clk, posedge rst) begin
        if (rst)
            ps <= `idle;
        else begin
        	if (clkEn)
            	ps <= ns;
        end
    end
    
endmodule