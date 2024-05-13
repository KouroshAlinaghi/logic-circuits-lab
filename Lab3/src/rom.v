module ROM(
	addr,
	po
);
	input [5:0] addr;

	output [7:0] po;
	reg [7:0] po;
	reg [7:0] rom[0:63];

	always @(addr) begin
		po = rom[addr];
	end

	initial begin
		$readmemb("sine.mem", rom);
	end
		
endmodule