module mux8x1 (output [31:0] result, input [31:0] resu0, resu1, resu2, resu3, resu4, resu5, resu6, resu7, input [2:0]sel);

	wire [2:0] sel_not;
	wire [31:0] res_and;
	wire [31:0] res_or;
	wire [31:0] res_xor;
	wire [31:0] res_nor;
	wire [31:0] res_slt;
	wire [31:0] res_add;
	wire [31:0] res_sub;
	wire [31:0] res_mod;
	wire [31:0] ort1_out;
	wire [31:0] ort2_out;
	wire [31:0] ort3_out;
	wire [31:0] ort4_out;
	wire [31:0] ort5_out;
	wire [31:0] ort6_out;
	not (sel_not[0], sel[0]);
	not (sel_not[1], sel[1]);
	not (sel_not[2], sel[2]);
	
	and andt1(andt1_out, sel_not[1], sel_not[0]);
	and is_and_g (is_and, andt1_out, sel_not[2]);
	
	and andt2(andt2_out, sel_not[1], sel[0]);
	and is_or_g (is_or, andt2_out, sel_not[2]);
	
	and andt3(andt3_out, sel[1], sel_not[0]);
	and is_xor_g (is_xor, andt3_out, sel_not[2]);

	and andt4(andt4_out, sel[1], sel[0]);
	and is_nor_g (is_nor, andt4_out, sel_not[2]);
	
	and andt5(andt5_out, sel_not[1], sel_not[0]);
	and is_slt_g (is_slt, andt5_out, sel[2]);	
	
	and andt6(andt6_out, sel_not[1], sel[0]);
	and is_add_g (is_add, andt6_out, sel[2]);	

	and andt7(andt7_out, sel[1], sel_not[0]);
	and is_sub_g (is_sub, andt7_out, sel[2]);	

	and andt8(andt8_out, sel[1], sel[0]);
	and is_mod_g (is_mod, andt8_out, sel_not[2]);
	
	and a_and1  (res_and[0], is_and, resu0[0]);
	and a_and2  (res_and[1], is_and, resu0[1]);
	and a_and3  (res_and[2], is_and, resu0[2]);
	and a_and4  (res_and[3], is_and, resu0[3]);
	and a_and5  (res_and[4], is_and, resu0[4]);
	and a_and6  (res_and[5], is_and, resu0[5]);
	and a_and7  (res_and[6], is_and, resu0[6]);
	and a_and8  (res_and[7], is_and, resu0[7]);
	and a_and9  (res_and[8], is_and, resu0[8]);
	and a_and10 (res_and[9], is_and, resu0[9]);
	and a_and11 (res_and[10], is_and, resu0[10]);
	and a_and12 (res_and[11], is_and, resu0[11]);
	and a_and13 (res_and[12], is_and, resu0[12]);
	and a_and14 (res_and[13], is_and, resu0[13]);
	and a_and15 (res_and[14], is_and, resu0[14]);
	and a_and16 (res_and[15], is_and, resu0[15]);
	and a_and17 (res_and[16], is_and, resu0[16]);
	and a_and18 (res_and[17], is_and, resu0[17]);
	and a_and19 (res_and[18], is_and, resu0[18]);
	and a_and20 (res_and[19], is_and, resu0[19]);
	and a_and21 (res_and[20], is_and, resu0[20]);
	and a_and22 (res_and[21], is_and, resu0[21]);
	and a_and23 (res_and[22], is_and, resu0[22]);
	and a_and24 (res_and[23], is_and, resu0[23]);
	and a_and25 (res_and[24], is_and, resu0[24]);
	and a_and26 (res_and[25], is_and, resu0[25]);
	and a_and27 (res_and[26], is_and, resu0[26]);
	and a_and28 (res_and[27], is_and, resu0[27]);
	and a_and29 (res_and[28], is_and, resu0[28]);
	and a_and30 (res_and[29], is_and, resu0[29]);
	and a_and31 (res_and[30], is_and, resu0[30]);
	and a_and32 (res_and[31], is_and, resu0[31]);
	
	and a_or1   (res_or[0], is_or, resu1[0]);
	and a_or2   (res_or[1], is_or, resu1[1]);
	and a_or3   (res_or[2], is_or, resu1[2]);
	and a_or4   (res_or[3], is_or, resu1[3]);
	and a_or5   (res_or[4], is_or, resu1[4]);
	and a_or6   (res_or[5], is_or, resu1[5]);
	and a_or7   (res_or[6], is_or, resu1[6]);
	and a_or8   (res_or[7], is_or, resu1[7]);
	and a_or9   (res_or[8], is_or, resu1[8]);
	and a_or10  (res_or[9], is_or, resu1[9]);
	and a_or11  (res_or[10], is_or, resu1[10]);
	and a_or12  (res_or[11], is_or, resu1[11]);
	and a_or13  (res_or[12], is_or, resu1[12]);
	and a_or14  (res_or[13], is_or, resu1[13]);
	and a_or15  (res_or[14], is_or, resu1[14]);
	and a_or16  (res_or[15], is_or, resu1[15]);
	and a_or17  (res_or[16], is_or, resu1[16]);
	and a_or18  (res_or[17], is_or, resu1[17]);
	and a_or19  (res_or[18], is_or, resu1[18]);
	and a_or20  (res_or[19], is_or, resu1[19]);
	and a_or21  (res_or[20], is_or, resu1[20]);
	and a_or22  (res_or[21], is_or, resu1[21]);
	and a_or23  (res_or[22], is_or, resu1[22]);
	and a_or24  (res_or[23], is_or, resu1[23]);
	and a_or25  (res_or[24], is_or, resu1[24]);
	and a_or26  (res_or[25], is_or, resu1[25]);
	and a_or27  (res_or[26], is_or, resu1[26]);
	and a_or28  (res_or[27], is_or, resu1[27]);
	and a_or29  (res_or[28], is_or, resu1[28]);
	and a_or30  (res_or[29], is_or, resu1[29]);
	and a_or31  (res_or[30], is_or, resu1[30]);
	and a_or32  (res_or[31], is_or, resu1[31]);
	
	and a_xor1  (res_xor[0], is_xor, resu2[0]);
	and a_xor2  (res_xor[1], is_xor, resu2[1]);
	and a_xor3  (res_xor[2], is_xor, resu2[2]);
	and a_xor4  (res_xor[3], is_xor, resu2[3]);
	and a_xor5  (res_xor[4], is_xor, resu2[4]);
	and a_xor6  (res_xor[5], is_xor, resu2[5]);
	and a_xor7  (res_xor[6], is_xor, resu2[6]);
	and a_xor8  (res_xor[7], is_xor, resu2[7]);
	and a_xor9  (res_xor[8], is_xor, resu2[8]);
	and a_xor10 (res_xor[9], is_xor, resu2[9]);
	and a_xor11 (res_xor[10], is_xor, resu2[10]);
	and a_xor12 (res_xor[11], is_xor, resu2[11]);
	and a_xor13 (res_xor[12], is_xor, resu2[12]);
	and a_xor14 (res_xor[13], is_xor, resu2[13]);
	and a_xor15 (res_xor[14], is_xor, resu2[14]);
	and a_xor16 (res_xor[15], is_xor, resu2[15]);
	and a_xor17 (res_xor[16], is_xor, resu2[16]);
	and a_xor18 (res_xor[17], is_xor, resu2[17]);
	and a_xor19 (res_xor[18], is_xor, resu2[18]);
	and a_xor20 (res_xor[19], is_xor, resu2[19]);
	and a_xor21 (res_xor[20], is_xor, resu2[20]);
	and a_xor22 (res_xor[21], is_xor, resu2[21]);
	and a_xor23 (res_xor[22], is_xor, resu2[22]);
	and a_xor24 (res_xor[23], is_xor, resu2[23]);
	and a_xor25 (res_xor[24], is_xor, resu2[24]);
	and a_xor26 (res_xor[25], is_xor, resu2[25]);
	and a_xor27 (res_xor[26], is_xor, resu2[26]);
	and a_xor28 (res_xor[27], is_xor, resu2[27]);
	and a_xor29 (res_xor[28], is_xor, resu2[28]);
	and a_xor30 (res_xor[29], is_xor, resu2[29]);
	and a_xor31 (res_xor[30], is_xor, resu2[30]);
	and a_xor32 (res_xor[31], is_xor, resu2[31]);
	
	and a_nor1  (res_nor[0], is_nor, resu3[0]);
	and a_nor2  (res_nor[1], is_nor, resu3[1]);
	and a_nor3  (res_nor[2], is_nor, resu3[2]);
	and a_nor4  (res_nor[3], is_nor, resu3[3]);
	and a_nor5  (res_nor[4], is_nor, resu3[4]);
	and a_nor6  (res_nor[5], is_nor, resu3[5]);
	and a_nor7  (res_nor[6], is_nor, resu3[6]);
	and a_nor8  (res_nor[7], is_nor, resu3[7]);
	and a_nor9  (res_nor[8], is_nor, resu3[8]);
	and a_nor10 (res_nor[9], is_nor, resu3[9]);
	and a_nor11 (res_nor[10], is_nor, resu3[10]);
	and a_nor12 (res_nor[11], is_nor, resu3[11]);
	and a_nor13 (res_nor[12], is_nor, resu3[12]);
	and a_nor14 (res_nor[13], is_nor, resu3[13]);
	and a_nor15 (res_nor[14], is_nor, resu3[14]);
	and a_nor16 (res_nor[15], is_nor, resu3[15]);
	and a_nor17 (res_nor[16], is_nor, resu3[16]);
	and a_nor18 (res_nor[17], is_nor, resu3[17]);
	and a_nor19 (res_nor[18], is_nor, resu3[18]);
	and a_nor20 (res_nor[19], is_nor, resu3[19]);
	and a_nor21 (res_nor[20], is_nor, resu3[20]);
	and a_nor22 (res_nor[21], is_nor, resu3[21]);
	and a_nor23 (res_nor[22], is_nor, resu3[22]);
	and a_nor24 (res_nor[23], is_nor, resu3[23]);
	and a_nor25 (res_nor[24], is_nor, resu3[24]);
	and a_nor26 (res_nor[25], is_nor, resu3[25]);
	and a_nor27 (res_nor[26], is_nor, resu3[26]);
	and a_nor28 (res_nor[27], is_nor, resu3[27]);
	and a_nor29 (res_nor[28], is_nor, resu3[28]);
	and a_nor30 (res_nor[29], is_nor, resu3[29]);
	and a_nor31 (res_nor[30], is_nor, resu3[30]);
	and a_nor32 (res_nor[31], is_nor, resu3[31]);
	
	and a_slt1  (res_slt[0], is_slt, resu4[0]);
	and a_slt2  (res_slt[1], is_slt, resu4[1]);
	and a_slt3  (res_slt[2], is_slt, resu4[2]);
	and a_slt4  (res_slt[3], is_slt, resu4[3]);
	and a_slt5  (res_slt[4], is_slt, resu4[4]);
	and a_slt6  (res_slt[5], is_slt, resu4[5]);
	and a_slt7  (res_slt[6], is_slt, resu4[6]);
	and a_slt8  (res_slt[7], is_slt, resu4[7]);
	and a_slt9  (res_slt[8], is_slt, resu4[8]);
	and a_slt10 (res_slt[9], is_slt, resu4[9]);
	and a_slt11 (res_slt[10], is_slt, resu4[10]);
	and a_slt12 (res_slt[11], is_slt, resu4[11]);
	and a_slt13 (res_slt[12], is_slt, resu4[12]);
	and a_slt14 (res_slt[13], is_slt, resu4[13]);
	and a_slt15 (res_slt[14], is_slt, resu4[14]);
	and a_slt16 (res_slt[15], is_slt, resu4[15]);
	and a_slt17 (res_slt[16], is_slt, resu4[16]);
	and a_slt18 (res_slt[17], is_slt, resu4[17]);
	and a_slt19 (res_slt[18], is_slt, resu4[18]);
	and a_slt20 (res_slt[19], is_slt, resu4[19]);
	and a_slt21 (res_slt[20], is_slt, resu4[20]);
	and a_slt22 (res_slt[21], is_slt, resu4[21]);
	and a_slt23 (res_slt[22], is_slt, resu4[22]);
	and a_slt24 (res_slt[23], is_slt, resu4[23]);
	and a_slt25 (res_slt[24], is_slt, resu4[24]);
	and a_slt26 (res_slt[25], is_slt, resu4[25]);
	and a_slt27 (res_slt[26], is_slt, resu4[26]);
	and a_slt28 (res_slt[27], is_slt, resu4[27]);
	and a_slt29 (res_slt[28], is_slt, resu4[28]);
	and a_slt30 (res_slt[29], is_slt, resu4[29]);
	and a_slt31 (res_slt[30], is_slt, resu4[30]);
	and a_slt32 (res_slt[31], is_slt, resu4[31]);
	
	and a_add1  (res_add[0], is_add, resu5[0]);
	and a_add2  (res_add[1], is_add, resu5[1]);
	and a_add3  (res_add[2], is_add, resu5[2]);
	and a_add4  (res_add[3], is_add, resu5[3]);
	and a_add5  (res_add[4], is_add, resu5[4]);
	and a_add6  (res_add[5], is_add, resu5[5]);
	and a_add7  (res_add[6], is_add, resu5[6]);
	and a_add8  (res_add[7], is_add, resu5[7]);
	and a_add9  (res_add[8], is_add, resu5[8]);
	and a_add10 (res_add[9], is_add, resu5[9]);
	and a_add11 (res_add[10], is_add, resu5[10]);
	and a_add12 (res_add[11], is_add, resu5[11]);
	and a_add13 (res_add[12], is_add, resu5[12]);
	and a_add14 (res_add[13], is_add, resu5[13]);
	and a_add15 (res_add[14], is_add, resu5[14]);
	and a_add16 (res_add[15], is_add, resu5[15]);
	and a_add17 (res_add[16], is_add, resu5[16]);
	and a_add18 (res_add[17], is_add, resu5[17]);
	and a_add19 (res_add[18], is_add, resu5[18]);
	and a_add20 (res_add[19], is_add, resu5[19]);
	and a_add21 (res_add[20], is_add, resu5[20]);
	and a_add22 (res_add[21], is_add, resu5[21]);
	and a_add23 (res_add[22], is_add, resu5[22]);
	and a_add24 (res_add[23], is_add, resu5[23]);
	and a_add25 (res_add[24], is_add, resu5[24]);
	and a_add26 (res_add[25], is_add, resu5[25]);
	and a_add27 (res_add[26], is_add, resu5[26]);
	and a_add28 (res_add[27], is_add, resu5[27]);
	and a_add29 (res_add[28], is_add, resu5[28]);
	and a_add30 (res_add[29], is_add, resu5[29]);
	and a_add31 (res_add[30], is_add, resu5[30]);
	and a_add32 (res_add[31], is_add, resu5[31]);
	
	and a_sub1  (res_sub[0], is_sub, resu6[0]);
	and a_sub2  (res_sub[1], is_sub, resu6[1]);
	and a_sub3  (res_sub[2], is_sub, resu6[2]);
	and a_sub4  (res_sub[3], is_sub, resu6[3]);
	and a_sub5  (res_sub[4], is_sub, resu6[4]);
	and a_sub6  (res_sub[5], is_sub, resu6[5]);
	and a_sub7  (res_sub[6], is_sub, resu6[6]);
	and a_sub8  (res_sub[7], is_sub, resu6[7]);
	and a_sub9  (res_sub[8], is_sub, resu6[8]);
	and a_sub10 (res_sub[9], is_sub, resu6[9]);
	and a_sub11 (res_sub[10], is_sub, resu6[10]);
	and a_sub12 (res_sub[11], is_sub, resu6[11]);
	and a_sub13 (res_sub[12], is_sub, resu6[12]);
	and a_sub14 (res_sub[13], is_sub, resu6[13]);
	and a_sub15 (res_sub[14], is_sub, resu6[14]);
	and a_sub16 (res_sub[15], is_sub, resu6[15]);
	and a_sub17 (res_sub[16], is_sub, resu6[16]);
	and a_sub18 (res_sub[17], is_sub, resu6[17]);
	and a_sub19 (res_sub[18], is_sub, resu6[18]);
	and a_sub20 (res_sub[19], is_sub, resu6[19]);
	and a_sub21 (res_sub[20], is_sub, resu6[20]);
	and a_sub22 (res_sub[21], is_sub, resu6[21]);
	and a_sub23 (res_sub[22], is_sub, resu6[22]);
	and a_sub24 (res_sub[23], is_sub, resu6[23]);
	and a_sub25 (res_sub[24], is_sub, resu6[24]);
	and a_sub26 (res_sub[25], is_sub, resu6[25]);
	and a_sub27 (res_sub[26], is_sub, resu6[26]);
	and a_sub28 (res_sub[27], is_sub, resu6[27]);
	and a_sub29 (res_sub[28], is_sub, resu6[28]);
	and a_sub30 (res_sub[29], is_sub, resu6[29]);
	and a_sub31 (res_sub[30], is_sub, resu6[30]);
	and a_sub32 (res_sub[31], is_sub, resu6[31]);
	
	and a_mod1  (res_mod[0], is_mod, resu7[0]);
	and a_mod2  (res_mod[1], is_mod, resu7[1]);
	and a_mod3  (res_mod[2], is_mod, resu7[2]);
	and a_mod4  (res_mod[3], is_mod, resu7[3]);
	and a_mod5  (res_mod[4], is_mod, resu7[4]);
	and a_mod6  (res_mod[5], is_mod, resu7[5]);
	and a_mod7  (res_mod[6], is_mod, resu7[6]);
	and a_mod8  (res_mod[7], is_mod, resu7[7]);
	and a_mod9  (res_mod[8], is_mod, resu7[8]);
	and a_mod10 (res_mod[9], is_mod, resu7[9]);
	and a_mod11 (res_mod[10], is_mod, resu7[10]);
	and a_mod12 (res_mod[11], is_mod, resu7[11]);
	and a_mod13 (res_mod[12], is_mod, resu7[12]);
	and a_mod14 (res_mod[13], is_mod, resu7[13]);
	and a_mod15 (res_mod[14], is_mod, resu7[14]);
	and a_mod16 (res_mod[15], is_mod, resu7[15]);
	and a_mod17 (res_mod[16], is_mod, resu7[16]);
	and a_mod18 (res_mod[17], is_mod, resu7[17]);
	and a_mod19 (res_mod[18], is_mod, resu7[18]);
	and a_mod20 (res_mod[19], is_mod, resu7[19]);
	and a_mod21 (res_mod[20], is_mod, resu7[20]);
	and a_mod22 (res_mod[21], is_mod, resu7[21]);
	and a_mod23 (res_mod[22], is_mod, resu7[22]);
	and a_mod24 (res_mod[23], is_mod, resu7[23]);
	and a_mod25 (res_mod[24], is_mod, resu7[24]);
	and a_mod26 (res_mod[25], is_mod, resu7[25]);
	and a_mod27 (res_mod[26], is_mod, resu7[26]);
	and a_mod28 (res_mod[27], is_mod, resu7[27]);
	and a_mod29 (res_mod[28], is_mod, resu7[28]);
	and a_mod30 (res_mod[29], is_mod, resu7[29]);
	and a_mod31 (res_mod[30], is_mod, resu7[30]);
	and a_mod32 (res_mod[31], is_mod, resu7[31]);


	or_32bit  ort1 (ort1_out, res_or, res_and);
	or_32bit  ort2 (ort2_out, res_xor, res_nor);
	or_32bit  ort3 (ort3_out, res_add, res_slt);
	or_32bit  ort4 (ort4_out, res_sub, res_mod);
	or_32bit  ort5 (ort5_out, ort2_out, ort1_out);
	or_32bit  ort6 (ort6_out, ort3_out, ort4_out);
	or_32bit  ort7 (result, ort6_out, ort5_out);
endmodule