module sign_extend(output [31:0] sign_ext_imm, input [15:0] imm);
//Tested and working
	or_16bit or1 (sign_ext_imm[15:0], 16'b0, imm[15:0]);
	
	or or17 (sign_ext_imm[16], imm[15], imm[15]);
	or or18 (sign_ext_imm[17], imm[15], imm[15]);
	or or19 (sign_ext_imm[18], imm[15], imm[15]);
	or or20 (sign_ext_imm[19], imm[15], imm[15]);
	or or21 (sign_ext_imm[20], imm[15], imm[15]);
	or or22 (sign_ext_imm[21], imm[15], imm[15]);
	or or23 (sign_ext_imm[22], imm[15], imm[15]);
	or or24 (sign_ext_imm[23], imm[15], imm[15]);
	or or25 (sign_ext_imm[24], imm[15], imm[15]);
	or or26 (sign_ext_imm[25], imm[15], imm[15]);
	or or27 (sign_ext_imm[26], imm[15], imm[15]);
	or or28 (sign_ext_imm[27], imm[15], imm[15]);
	or or29 (sign_ext_imm[28], imm[15], imm[15]);
	or or30 (sign_ext_imm[29], imm[15], imm[15]);
	or or31 (sign_ext_imm[30], imm[15], imm[15]);
	or or32 (sign_ext_imm[31], imm[15], imm[15]);
endmodule
