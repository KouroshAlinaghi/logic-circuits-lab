`timescale 1ns/1ns

module ShiftReg2(
		SerIn, shen, clk, rst, clkEn, rst_cu,
		SerOut
	);

	input SerIn, shen, clk, rst, clkEn, rst_cu;
	output [1:0] SerOut;

	reg [1:0] SerOut = 2'b00;

	always @(posedge clk, posedge rst) begin
		if (rst)
			SerOut <= 2'b00;
		else begin
			if (rst)
				SerOut <= 2'b00;
			else begin
				if (shen & clkEn)
					SerOut <= {SerOut[0], SerIn};
				else
					SerOut <= SerOut;
			end
		end
	end

endmodule