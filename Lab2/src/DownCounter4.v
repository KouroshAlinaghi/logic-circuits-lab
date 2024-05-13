`timescale 1ns/1ns

module DownCounter4(
		cen, ld, clk, rst, clkEn, pin, rst_cu,
		co, pout
	);

	input cen, ld, clk, rst, clkEn, rst_cu;
	input [3:0] pin;
	output co;
	output [3:0] pout;

	reg [3:0] pout = 4'b000;

	always @(posedge clkEn, posedge rst) begin
		if (rst)
			pout <= 4'b0000;
		else begin
			if (rst_cu)
				pout <= 4'b0000;
			else begin
				if (ld & clkEn) begin
					pout <= pin;
				end else begin
					if (cen & clkEn)
						pout <= pout - 4'b0001;
					else
						pout <= pout;
				end
			end
		end
	end

	assign co = (pout == 4'b0001) ? 1'b1 : 1'b0;
endmodule