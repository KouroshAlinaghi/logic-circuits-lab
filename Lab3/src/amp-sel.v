module AmpSelector(
	sel, pi,
	po
);
	input [1:0] sel;
	input [7:0] pi;

	output [7:0] po;

	assign po = (sel == 2'b00) ? pi :
				(sel == 2'b01) ? pi >> 1 :
				(sel == 2'b10) ? pi >> 2 :
				pi >> 3;
endmodule