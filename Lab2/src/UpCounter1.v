`timescale 1ns/1ns

module UpCounter1(
		cen, clk, rst, clkEn, rst_cu,
		co
	);

	input cen, clk, rst, clkEn, rst_cu;
	output co;

	reg cnt_po = 1'b0;

	always @(posedge clk, posedge rst) begin
		if (rst)
			cnt_po <= 1'b0;
		else begin
			if (rst_cu)
				cnt_po <= 1'b0;
			else begin
				if (cen & clkEn)
					cnt_po <= ~cnt_po;
				else
					cnt_po <= cnt_po;
			end
		end
	end

	assign co = cnt_po;
endmodule