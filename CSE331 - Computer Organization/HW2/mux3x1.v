module mux3x1 (output [31:0]result, input [31:0] resu0, resu1, input [2:0]sel);
	wire [2:0] sel_not;
	wire [31:0] res_add;
	wire [31:0]	res_sub;
	not (sel_not[0], sel[0]);
	not (sel_not[1], sel[1]);
	not (sel_not[2], sel[2]);
	
	and andt1    (andt1_out, sel_not[1], sel[0]);
	and is_add_g (is_add, andt1_out, sel[2]);	

	and andt2    (andt2_out, sel[1], sel_not[0]);
	and is_sub_g (is_sub, andt2_out, sel[2]);	

	and andt3    (andt3_out, sel[1], sel[0]);
	and is_mod_g (is_mod, andt3_out, sel[2]);

	and a_add1  (res_add[0], is_add, resu0[0]);
	and a_add2  (res_add[1], is_add, resu0[1]);
	and a_add3  (res_add[2], is_add, resu0[2]);
	and a_add4  (res_add[3], is_add, resu0[3]);
	and a_add5  (res_add[4], is_add, resu0[4]);
	and a_add6  (res_add[5], is_add, resu0[5]);
	and a_add7  (res_add[6], is_add, resu0[6]);
	and a_add8  (res_add[7], is_add, resu0[7]);
	and a_add9  (res_add[8], is_add, resu0[8]);
	and a_add10 (res_add[9], is_add, resu0[9]);
	and a_add11 (res_add[10], is_add, resu0[10]);
	and a_add12 (res_add[11], is_add, resu0[11]);
	and a_add13 (res_add[12], is_add, resu0[12]);
	and a_add14 (res_add[13], is_add, resu0[13]);
	and a_add15 (res_add[14], is_add, resu0[14]);
	and a_add16 (res_add[15], is_add, resu0[15]);
	and a_add17 (res_add[16], is_add, resu0[16]);
	and a_add18 (res_add[17], is_add, resu0[17]);
	and a_add19 (res_add[18], is_add, resu0[18]);
	and a_add20 (res_add[19], is_add, resu0[19]);
	and a_add21 (res_add[20], is_add, resu0[20]);
	and a_add22 (res_add[21], is_add, resu0[21]);
	and a_add23 (res_add[22], is_add, resu0[22]);
	and a_add24 (res_add[23], is_add, resu0[23]);
	and a_add25 (res_add[24], is_add, resu0[24]);
	and a_add26 (res_add[25], is_add, resu0[25]);
	and a_add27 (res_add[26], is_add, resu0[26]);
	and a_add28 (res_add[27], is_add, resu0[27]);
	and a_add29 (res_add[28], is_add, resu0[28]);
	and a_add30 (res_add[29], is_add, resu0[29]);
	and a_add31 (res_add[30], is_add, resu0[30]);
	and a_add32 (res_add[31], is_add, resu0[31]);
	
	and a_sub1  (res_sub[0], is_sub, resu1[0]);
	and a_sub2  (res_sub[1], is_sub, resu1[1]);
	and a_sub3  (res_sub[2], is_sub, resu1[2]);
	and a_sub4  (res_sub[3], is_sub, resu1[3]);
	and a_sub5  (res_sub[4], is_sub, resu1[4]);
	and a_sub6  (res_sub[5], is_sub, resu1[5]);
	and a_sub7  (res_sub[6], is_sub, resu1[6]);
	and a_sub8  (res_sub[7], is_sub, resu1[7]);
	and a_sub9  (res_sub[8], is_sub, resu1[8]);
	and a_sub10 (res_sub[9], is_sub, resu1[9]);
	and a_sub11 (res_sub[10], is_sub, resu1[10]);
	and a_sub12 (res_sub[11], is_sub, resu1[11]);
	and a_sub13 (res_sub[12], is_sub, resu1[12]);
	and a_sub14 (res_sub[13], is_sub, resu1[13]);
	and a_sub15 (res_sub[14], is_sub, resu1[14]);
	and a_sub16 (res_sub[15], is_sub, resu1[15]);
	and a_sub17 (res_sub[16], is_sub, resu1[16]);
	and a_sub18 (res_sub[17], is_sub, resu1[17]);
	and a_sub19 (res_sub[18], is_sub, resu1[18]);
	and a_sub20 (res_sub[19], is_sub, resu1[19]);
	and a_sub21 (res_sub[20], is_sub, resu1[20]);
	and a_sub22 (res_sub[21], is_sub, resu1[21]);
	and a_sub23 (res_sub[22], is_sub, resu1[22]);
	and a_sub24 (res_sub[23], is_sub, resu1[23]);
	and a_sub25 (res_sub[24], is_sub, resu1[24]);
	and a_sub26 (res_sub[25], is_sub, resu1[25]);
	and a_sub27 (res_sub[26], is_sub, resu1[26]);
	and a_sub28 (res_sub[27], is_sub, resu1[27]);
	and a_sub29 (res_sub[28], is_sub, resu1[28]);
	and a_sub30 (res_sub[29], is_sub, resu1[29]);
	and a_sub31 (res_sub[30], is_sub, resu1[30]);
	and a_sub32 (res_sub[31], is_sub, resu1[31]);
	
	or_32bit  ort1 (result, res_add, res_sub);

endmodule
