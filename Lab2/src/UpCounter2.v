`timescale 1ns/1ns

module UpCounter2(
		cen, clk, rst, clkEn, rst_cu,
		co
	);

	input cen, clk, rst, clkEn, rst_cu;
	output co;

	reg [1:0] cnt_po = 2'b00;

	always @(posedge clk, posedge rst) begin
		if (rst)
			cnt_po <= 2'b00;
		else begin
			if (rst_cu)
				cnt_po <= 2'b00;
			else begin
				if (cen & clkEn)
					cnt_po <= cnt_po + 2'b01;
				else
					cnt_po <= cnt_po;
			end
		end
	end

	assign co = &{cnt_po};
endmodule