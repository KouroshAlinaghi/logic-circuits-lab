module Everything(
	clk, rst, ld, sw,
	po, pwm_out
);
	input clk, rst, ld;
	input [9:0] sw;

	output pwm_out;
	output [7:0] po;

	wire [7:0] sine;
	wire new_clk;
	
	WaveformGenerator wfg(
		new_clk, rst, sine, sw[9:7],
		po
	);

	FrequencySelector fs(
		clk, rst, sw[4:0], {0, 1, 1, 0}, ld,
		new_clk
	);

	AmpSelector as(
		sw[6:5], trp,
		po
	);

	DDSUnit dds(
		clk, rst,
		sine
	);

	PWM pwm(
		clk, rst, po,
		pwm_out
	);
endmodule