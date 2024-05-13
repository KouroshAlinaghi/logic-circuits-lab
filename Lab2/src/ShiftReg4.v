`timescale 1ns/1ns

module ShiftReg4(
		SerIn, shen, clk, rst, clkEn, rst_cu,
		SerOut
	);

	input SerIn, shen, clk, rst, clkEn, rst_cu;
	output [3:0] SerOut;

	reg [3:0] SerOut = 4'b0000;

	always @(posedge clk, posedge rst) begin
		if (rst)
			SerOut <= 4'b0000;
		else begin
			if (rst_cu)
				SerOut <= 4'b0000;
			else begin
				if (shen & clkEn)
					SerOut <= {SerOut[2:0], SerIn};
				else
					SerOut <= SerOut;
			end
		end
	end

endmodule