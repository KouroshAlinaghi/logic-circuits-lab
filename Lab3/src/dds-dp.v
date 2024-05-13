module DDSDatapath(
	clk, rst,
	co, addr
);
	input clk, rst;

	output co;
	output [5:0] addr;

	reg [5:0] cnt_val = 6'b00_0000;

	always @(posedge clk, posedge rst) begin
		if (rst)
			cnt_val <= 6'b00_0000;
		else
			cnt_val <= cnt_val + 6'b00_0001;
	end

	assign co = &{cnt_val};
	assign addr = cnt_val;
endmodule