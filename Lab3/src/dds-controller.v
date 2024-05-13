`define QRT_1 2'b00
`define QRT_2 2'b01
`define QRT_3 2'b10
`define QRT_4 2'b11

module DDSController(
	clk, rst, co,
	sign_bit, phase_pos
);
	input clk, rst, co;

	output sign_bit, phase_pos;
	reg sign_bit, phase_pos;

	reg [2:0] ps = `QRT_1;
	reg [2:0] ns = `QRT_1;

	reg [7:0] cnt_val = 8'b0000_0000;

    always @(ps, co) begin
        case (ps)
            `QRT_1: ns = co ? `QRT_2 : `QRT_1;
            `QRT_2: ns = co ? `QRT_3 : `QRT_2;
            `QRT_3: ns = co ? `QRT_4 : `QRT_3;
            `QRT_4: ns = co ? `QRT_1 : `QRT_4;
        endcase
    end
    
    always @(posedge clk, posedge rst) begin
		{sign_bit, phase_pos} = 2'b00;

        case (ps)
            `QRT_1: {sign_bit, phase_pos} = 2'b01;
            `QRT_2: {sign_bit, phase_pos} = 2'b00;
            `QRT_3: {sign_bit, phase_pos} = 2'b11;
            `QRT_4: {sign_bit, phase_pos} = 2'b10;
            default: {sign_bit, phase_pos} = 2'b00;
        endcase
    end

    always @(posedge clk, posedge rst) begin
        if (rst)
            ps <= `QRT_1;
        else
            ps <= ns;
    end

endmodule