module PWM(
	clk, rst, pin,
	out
);
	input clk, rst;
	input [7:0] pin;

	output out;

	reg [7:0] cnt_val = 8'b0000_0000;

	always @(posedge clk, posedge rst) begin
		if (rst)
			cnt_val <= 8'b0000_0000;
		else
			cnt_val <= cnt_val + 8'b0000_0001;
	end

	assign out = (cnt_val < pin) ? 1'b1 : 1'b0;
endmodule