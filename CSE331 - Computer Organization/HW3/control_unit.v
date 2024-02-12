module control_unit(output regDst, branch, memRead, memWrite, ALUsrc, regWrite, jump, byteOperations, move, output[2:0] ALUOp, input [5:0] opcode);
	wire [5:0] OpNot;
	wire [2:0] alu1, alu2, alu3, alu4, alu5, alu6, alu7, tempALU1_out, tempALU2_out, tempALU3_out, tempALU4_out, tempALU5_out;
	
	not notOp1 (OpNot[0], opcode[0]);
	not notOp2 (OpNot[1], opcode[1]);
	not notOp3 (OpNot[2], opcode[2]);
	not notOp4 (OpNot[3], opcode[3]);
	not notOp5 (OpNot[4], opcode[4]);
	not notOp6 (OpNot[5], opcode[5]);
	
	and init1 (iregDst,	 0, 0);//initializing output signals as 0
	and init2 (ibranch,	 0, 0);
	and init3 (imemRead,	 0, 0);
	and init4 (imemWrite, 0, 0);
	and init5 (iALUsrc,	 0, 0);
	and init6 (iregWrite, 0, 0);
	and init7 (ijump, 	 0, 0);
	and init8 (ibyteOps,  0, 0);
	and init9 (imove, 	 0, 0);
	
	and andt6(is_000, opcode[2], OpNot[0]);    //controlling cases where XXX1X0 for andi
	
	and andt7(andt7_out, opcode[0], OpNot[1]); //controlling cases where XXX101 for ori
	and andt8(is_001, andt7_out, opcode[2]);	
	
	and andt21(andt21_out, OpNot[5], opcode[0]);  //controlling cases where 0XX111 for slti
	and andt22(andt22_out, opcode[2], opcode[1]);
	and andt23(is_100, andt21_out, andt22_out);

	and andt1(andt1_out, OpNot[5], OpNot[2]);  //controlling cases where 0XX00X for lw, sw, lb, sb
	and andt2(is_mem, andt1_out, OpNot[1]);
	and andt3(andt3_out, opcode[1], OpNot[0]); //controlling for addi
	or ort1(is_101, is_mem, andt3_out);
	
	and andt9(is_branch, opcode[5], opcode[0]); //controlling cases where  1XXXX1 for beq bne
	and andt10(andt10_out, OpNot[2], opcode[1]); //controlling cases where XXX011 for subi
	and andt12(andt12_out, opcode[0], andt10_out);
	or ort2(is_110, is_branch, andt12_out);
	
	and andtr1(andtr1_out, OpNot[5], OpNot[4]);//controlling cases where 00000X for R type instructions
	and andtr2(andtr2_out, OpNot[2], OpNot[3]);
	and andtr3(andtr3_out, OpNot[1], andtr1_out);
	and is_Rtype(is_111, andtr2_out, andtr3_out);
	
	and andt11(andt11_out, opcode[5], OpNot[4]);//Controlling cases where 10XXX0 for move instructions
	and is_moveq(is_011, andt11_out, OpNot[0]);
	
	and andj	(is_j, opcode[3], opcode[4]);  //controlling cases where X11XXX for j type

	not notr	(not_r, is_111);
	not notj	(not_j, is_j);
	and andI	(is_I, not_r, not_j);

	and alu1_and1	(alu1[0], is_000, 0);
	and alu1_and2	(alu1[1], is_000, 0);
	and alu1_and3	(alu1[2], is_000, 0);
	
	and alu2_and1	(alu2[0], is_001, 1);
	and alu2_and2	(alu2[1], is_001, 0);
	and alu2_and3	(alu2[2], is_001, 0);

	and alu3_and1	(alu3[0], is_100, 0);
	and alu3_and2	(alu3[1], is_100, 0);
	and alu3_and3	(alu3[2], is_100, 1);

	and alu4_and1	(alu4[0], is_101, 1);
	and alu4_and2	(alu4[1], is_101, 0);
	and alu4_and3	(alu4[2], is_101, 1);

	and alu5_and1	(alu5[0], is_110, 0);
	and alu5_and2	(alu5[1], is_110, 1);
	and alu5_and3	(alu5[2], is_110, 1);

	and alu6_and1	(alu6[0], is_111, 1);
	and alu6_and2	(alu6[1], is_111, 1);
	and alu6_and3	(alu6[2], is_111, 1);
	
	and alu7_and1	(alu7[0], is_011, 1);
	and alu7_and2	(alu7[1], is_011, 1);
	and alu7_and3	(alu7[2], is_011, 0);
	
	and andLoad		(is_load,  opcode[3], OpNot[5]);
	and andStore	(is_store, opcode[4], OpNot[5]);

	
	or_3bit tempALU1(tempALU1_out, alu1, alu2);
	or_3bit tempALU2(tempALU2_out, alu3, alu4);
	or_3bit tempALU3(tempALU3_out, alu5, alu6);
	or_3bit tempALU4(tempALU4_out, tempALU1_out, tempALU2_out);
	or_3bit tempALU5(tempALU5_out, alu7, tempALU4_out);
	or_3bit ALU (ALUOp, tempALU3_out, tempALU5_out);
	
	and R_regDst			(regDstR, is_111, 1);
	and R_regWrite			(regWriteR, is_111, 1);

	and R_regDstMove		(regDstM, is_011, 0);
	and R_move				(moveI, is_011, 1);

	or tempDst		(regDstLast, regDstR, regDstM);

	and I_memRead			(memReadI, is_load, 1);
	and I_memWrite			(memWriteI, is_store, 1);
	and I_ALUsrc			(ALUsrcI, is_I, 1);
	and I_regWrite			(regWriteI, is_I, 1);
	and I_regWrite_s		(regWriteS, is_store, 0);
	not notreg				(regWNot, regWriteS);
	and tempregW			(regWriteLast, regWNot, regWriteI);
	or  regWLast			(regWriteFinal, regWriteR, regWriteLast);
	and I_branch			(branchI, is_branch, 1);
	
	and I_jump				(jumpJ, is_111, 0);
	and I_byteOperations	(bopI, is_111, 0);
	
	
	or or_cu1 (regDst,		 	iregDst,	regDstLast);
	or or_cu2 (branch, 			ibranch, branchI);
	or or_cu3 (memRead,			imemRead, memReadI);
	or or_cu4 (memWrite,			imemWrite, memWriteI);
	or or_cu5 (ALUsrc, 			iALUsrc,	ALUsrcI);
	or or_cu6 (regWrite,			iregWrite, regWriteFinal);
	or or_cu7 (jump, 				ijump, jumpJ);
	or or_cu8 (byteOperations, ibyteOps, bopI);
	or or_cu9 (move,				imove, moveI);
	
endmodule


