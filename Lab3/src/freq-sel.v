module FrequencySelector(
	clk, rst, pi, hardwired, ld,
	new_clk
);
	input clk, rst, ld;
	input [4:0] pi;
	input [3:0] hardwired;

	output new_clk;

	wire co;

	reg [8:0] cnt_val = 8'b0000_0000;

	always @(posedge clk, posedge rst) begin
		if (rst)
			cnt_val <= 8'b0000_0000;
		else begin
			if (ld | co) 
				cnt_val <= {pi, hardwired};
			else 
				cnt_val <= cnt_val + 8'b0000_0001;
		end
	end

	assign co = &{cnt_val};
	assign new_clk = co;
endmodule