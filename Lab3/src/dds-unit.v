module DDSUnit(
	clk, rst,
	po
);
	input clk, rst;

	output [7:0] po;

	wire co, sign_bit, phase_pos;
	wire [5:0] addr;
	wire [5:0] rom_input;
	wire [7:0] rom_output;
	wire [7:0] sign_to_compl_input;

	DDSController cu(
		clk, rst, co,
		sign_bit, phase_pos
	);

	DDSDatapath dp(
		clk, rst,
		co, addr
	);

	ROM rom(
		rom_input,
		rom_output
	);

	assign rom_input = (phase_pos == 1'b1) ? addr : (~addr + 6'b00_0001);
	assign sign_to_compl_input = (phase_pos & (addr == 6'b00_0000)) ? 8'b1111_1111 : rom_output;
	assign po = (sign_bit == 1'b0) ? (~sign_to_compl_input + 1 + 255) : {sign_bit, sign_to_compl_input};
endmodule