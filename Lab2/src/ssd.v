`timescale 1ns/1ns

module SSD(
		in,
		out
	);

	input [3:0] in;
	output [6:0] out;

	reg [6:0] out = 7'b0000000;
	
	always @(in) begin
	    case (in)
            4'h0: out = 7'h40;
            4'h1: out = 7'h79;
            4'h2: out = 7'h24;
            4'h3: out = 7'h30;
            4'h4: out = 7'h19;
            4'h5: out = 7'h12;
            4'h6: out = 7'h02;
            4'h7: out = 7'h78;
            4'h8: out = 7'h00;
            4'h9: out = 7'h10;
            4'ha: out = 7'h08;
            4'hb: out = 7'h03;
            4'hc: out = 7'h46;
            4'hd: out = 7'h21;
            4'he: out = 7'h06;
            4'hf: out = 7'h0e;
        endcase
	end
endmodule