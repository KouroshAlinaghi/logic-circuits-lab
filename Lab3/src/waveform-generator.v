module WaveformGenerator(
	clk, rst, sine, sel,
	po
);
	input clk, rst;
	input [7:0] sine;
	input [2:0] sel;

	output [7:0] po;
	reg [7:0] po;

	wire [7:0] exp;
	wire [7:0] trn;
	wire [7:0] trp;
	wire [7:0] n_sine;
	wire [7:0] f_sine;
	wire [7:0] h_sine;

	reg [7:0] cnt_val = 8'b0000_0000;

	always @(posedge clk, posedge rst) begin
		if (rst)
			cnt_val <= 8'b0000_0000;
		else
			cnt_val <= cnt_val + 8'b0000_0001;
	end

	assign trn = (cnt_val < 128) ? (cnt_val << 1) : 511 - (cnt_val << 1);
	assign exp = (255) / (255 - cnt_val);
	assign trp = (cnt_val < 63) ? (cnt_val << 2) :
				 (cnt_val < 192) ? (255) : 
				 1023 - (cnt_val << 2);

	assign n_sine = sine;
	assign f_sine = (sine < 128) ? ((~sine + 1) + 255) : sine;
	assign h_sine = (sine < 128) ? 128 : sine;

	always @(sel, sine, trn, exp, trp) begin
		case (sel)
			0: po = exp;
			1: po = trn;
			2: po = trp;
			3: po = n_sine;
			4: po = f_sine;
			5: po = h_sine;
			default: po = n_sine;
		endcase
	end 
endmodule