module alu (output [31:0] alu_result, output zero_bit, input [31:0] alu_src1, input [31:0] alu_src2, input [2:0]alu_ctr); //ALU unit
	wire [31:0] res0;//Necessary wires
	wire [31:0] res1;
	wire [31:0] res2;
	wire [31:0] res3;
	wire [31:0] res4;
	wire [31:0] res5;
	wire [31:0] res6;
	wire [31:0] res7;
	wire cout;
	
	and_32bit and32b	(res0, alu_src1, alu_src2);
	or_32bit or32b 	(res1, alu_src1, alu_src2);
	xor_32bit xor32b	(res2, alu_src1, alu_src2);
	nor_32bit nor32b	(res3, alu_src1, alu_src2);
	slt_32bit slt32b 	(res4, alu_src1, alu_src2);
	adder add32bit 	(res5, cout, alu_src1, alu_src2, 1'b0, alu_ctr[0]);
	adder sub32bit		(res6, cout, alu_src1, alu_src2, 1'b0, alu_ctr[0]);
	adder move			(res7, cout, alu_src1, 32'b0, 1'b0, 1'b0);
	
	and and1 (zero_bit, 1, res4[0]);
	//According to alu_ctr bits returns requested result using 8x1 multiplexer
	mux8x1 mux2x1 (alu_result, res0, res1, res2, res3, res4, res5, res6, res7, alu_ctr);
	initial begin   
			#3 $display("alu_result: %b , adder_result: %b alu_ctr: %b", alu_result, res7, alu_ctr);
				$display("data1: %b , data2: %b alu_ctr: %b", alu_src1, alu_src2, alu_ctr);
		
		end
endmodule 