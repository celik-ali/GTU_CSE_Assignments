module alu_control(output [2:0] alu_ctr, input [5:0] function_code, input[2:0] ALUop);	
		wire [2:0] ALUopNot;
		wire [5:0] funcNot;
		wire [2:0] ALU_and, ALU_or, ALU_slt, ALU_add, ALU_sub, ALU_r;
		wire [2:0] ort1_out, ort2_out, ort3_out, ort4_out, ort5_out;
		wire [2:0] FUNC_and, FUNC_or, FUNC_slt, FUNC_add, FUNC_sub, FUNC_r;
		wire [2:0] ortf1_out, ortf2_out, ortf3_out, ortf4_out, ortf5_out;
			
		not notOp1 (ALUopNot[0], ALUop[0]);
		not notOp2 (ALUopNot[1], ALUop[1]);
		not notOp3 (ALUopNot[2], ALUop[2]);
		not notOp4 (funcNot[0], function_code[0]);
		not notOp5 (funcNot[1], function_code[1]);
		not notOp6 (funcNot[2], function_code[2]);
		not notOp7 (funcNot[3], function_code[3]);
		not notOp8 (funcNot[4], function_code[4]);
		not notOp9 (funcNot[5], function_code[5]);
		
		and andt1(andt1_out, ALUopNot[1], ALUopNot[0]);//000
		and is_and_g (is_and, andt1_out, ALUopNot[2]);
		
		and andt2(andt2_out, ALUopNot[1], ALUop[0]);//001
		and is_or_g (is_or, andt2_out, ALUopNot[2]);
		
		and andt5(andt5_out, ALUopNot[1], ALUopNot[0]);//100
		and is_slt_g (is_slt, andt5_out, ALUop[2]);	
		
		and andt6(andt6_out, ALUopNot[1], ALUop[0]);//101
		and is_add_g (is_add, andt6_out, ALUop[2]);	

		and andt7(andt7_out, ALUop[1], ALUopNot[0]);//110
		and is_sub_g (is_sub, andt7_out, ALUop[2]);	

		and andt8(andt8_out, ALUop[1], ALUop[0]);//111
		and is_r_g (is_r, andt8_out, ALUop[2]);
		
		and a_and1  (ALU_and[0], is_and, ALUop[0]);
		and a_and2  (ALU_and[1], is_and, ALUop[1]);
		and a_and3  (ALU_and[2], is_and, ALUop[2]);
		
		and a_or1   (ALU_or[0], is_or, 	ALUop[0]);
		and a_or2   (ALU_or[1], is_or, 	ALUop[1]);
		and a_or3   (ALU_or[2], is_or, 	ALUop[2]);
		
		and a_slt1  (ALU_slt[0], is_slt, ALUop[0]);
		and a_slt2  (ALU_slt[1], is_slt, ALUop[1]);
		and a_slt3  (ALU_slt[2], is_slt, ALUop[2]);
	
		and a_add1  (ALU_add[0], is_add, ALUop[0]);
		and a_add2  (ALU_add[1], is_add, ALUop[1]);
		and a_add3  (ALU_add[2], is_add, ALUop[2]);
	
		and a_sub1  (ALU_sub[0], is_sub, ALUop[0]);
		and a_sub2  (ALU_sub[1], is_sub, ALUop[1]);
		and a_sub3  (ALU_sub[2], is_sub, ALUop[2]);
		
		and is_and_g2 	(is_f_and, function_code[2], funcNot[0]);//checking cases where XXX1X0
		
		and andt11		(andt11_out, function_code[2], function_code[0]);//checking cases where XXX101
		and is_or_g2 	(is_f_or, andt11_out, funcNot[1]);
		
		and is_add_g2 	(is_f_add, function_code[1], funcNot[0]); //checking cases where XXXX10 for add
		
		and andt12		(andt12_out, function_code[1], function_code[0]);//checking cases where XXX011
		and is_sub_g2	(is_f_sub, andt12_out, funcNot[2]);

		and andt13		(andt13_out, function_code[1], function_code[0]);//checking cases where XXX111
		and is_slt_g2	(is_f_slt, function_code[2], andt13_out);
		
		and a_and11  (FUNC_and[0], is_f_and, 0);
		and a_and12  (FUNC_and[1], is_f_and, 0);
		and a_and13  (FUNC_and[2], is_f_and, 0);
		
		and a_or11   (FUNC_or[0],  is_f_or, 	1);
		and a_or12   (FUNC_or[1],  is_f_or, 	0);
		and a_or13   (FUNC_or[2],  is_f_or, 	0);
		
		and a_slt11  (FUNC_slt[0], is_f_slt, 0);
		and a_slt12  (FUNC_slt[1], is_f_slt, 0);
		and a_slt13  (FUNC_slt[2], is_f_slt, 1);
	
		and a_add11  (FUNC_add[0], is_f_add, 1);
		and a_add12  (FUNC_add[1], is_f_add, 0);
		and a_add13  (FUNC_add[2], is_f_add, 1);
	
		and a_sub11  (FUNC_sub[0], is_f_sub, 0);
		and a_sub12  (FUNC_sub[1], is_f_sub, 1);
		and a_sub13  (FUNC_sub[2], is_f_sub, 1);
		
		or_3bit ort_f_1(ortf1_out, FUNC_and, FUNC_or);
		or_3bit ort_f_2(ortf2_out, FUNC_slt, FUNC_add);
		or_3bit ort_f_3(ortf3_out, FUNC_sub, ortf1_out);
		or_3bit ort_f_4(ALU_r, ortf3_out, ortf2_out);
		
		or_3bit ort1(ort1_out, ALU_and, ALU_or);
		or_3bit ort2(ort2_out, ALU_slt, ALU_add);
		or_3bit ort3(ort3_out, ALU_sub, ALU_r);
		or_3bit ort4(ort4_out, ort1_out, ort2_out);
		or_3bit ort5(alu_ctr, ort3_out, ort4_out);
endmodule
