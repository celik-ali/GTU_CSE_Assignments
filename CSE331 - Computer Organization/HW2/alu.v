module alu (output [31:0] result, output is_done, input [31:0] a, input [31:0] b, input [2:0]sel, input CLK, reset); //ALU unit
	wire [31:0] res0;//Necessary wires
	wire [31:0] res1;
	wire [31:0] res2;
	wire [31:0] res3;
	wire [31:0] res4;
	wire [31:0] res5;
	wire [31:0] res6;
	wire [31:0] res7;
	wire cout;
	
	and_32bit and32b   (res0, a, b);
	or_32bit  or32b    (res1, a, b);
	xor_32bit xor32b   (res2, a, b);
	nor_32bit nor32b   (res3, a, b);
	slt_32bit slt32b   (res4, a, b);
	adder		 add32bit (res5, cout, a, b, sel);
	adder 	 sub32bit (res6, cout, a, b, sel);
	mod   	 mod1     (res7, is_done, reset, CLK, a, b);

	//According to selection bits returns requested result using 8x1 multiplexer
	mux8x1 mux (result, res0, res1, res2, res3, res4, res5, res6, res7, sel);

endmodule 