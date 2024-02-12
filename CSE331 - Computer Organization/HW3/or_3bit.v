module or_3bit(output [2:0] out_or, input [2:0] alu_1, alu_2);
			or or0(out_or[0], alu_1[0], alu_2[0]);
			or or1(out_or[1], alu_1[1], alu_2[1]);
			or or2(out_or[2], alu_1[2], alu_2[2]);

endmodule
