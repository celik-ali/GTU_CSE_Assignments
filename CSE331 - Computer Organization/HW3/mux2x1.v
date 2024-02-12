module mux2x1(output [31:0] result, input [31:0] option1, option2, input sel);
//Tested and working

	wire [31:0] result1;
	wire [31:0] result2;
	not not1 (not_sel, sel);
	
	and and1  (result1[0], sel, option1[0]);
	and and2  (result1[1], sel, option1[1]);
	and and3  (result1[2], sel, option1[2]);
	and and4  (result1[3], sel, option1[3]);
	and and5  (result1[4], sel, option1[4]);
	and and6  (result1[5], sel, option1[5]);
	and and7  (result1[6], sel, option1[6]);
	and and8  (result1[7], sel, option1[7]);
	and and9  (result1[8], sel, option1[8]);
	and and10 (result1[9], sel, option1[9]);
	and and11 (result1[10], sel, option1[10]);
	and and12 (result1[11], sel, option1[11]);
	and and13 (result1[12], sel, option1[12]);
	and and14 (result1[13], sel, option1[13]);
	and and15 (result1[14], sel, option1[14]);
	and and16 (result1[15], sel, option1[15]);
	and and17 (result1[16], sel, option1[16]);
	and and18 (result1[17], sel, option1[17]);
	and and19 (result1[18], sel, option1[18]);
	and and20 (result1[19], sel, option1[19]);
	and and21 (result1[20], sel, option1[20]);
	and and22 (result1[21], sel, option1[21]);
	and and23 (result1[22], sel, option1[22]);
	and and24 (result1[23], sel, option1[23]);
	and and25 (result1[24], sel, option1[24]);
	and and26 (result1[25], sel, option1[25]);
	and and27 (result1[26], sel, option1[26]);
	and and28 (result1[27], sel, option1[27]);
	and and29 (result1[28], sel, option1[28]);
	and and30 (result1[29], sel, option1[29]);
	and and31 (result1[30], sel, option1[30]);
	and and32 (result1[31], sel, option1[31]);
	
	and and2_1  (result2[0], not_sel, option2[0]);
	and and2_2  (result2[1], not_sel, option2[1]);
	and and2_3  (result2[2], not_sel, option2[2]);
	and and2_4  (result2[3], not_sel, option2[3]);
	and and2_5  (result2[4], not_sel, option2[4]);
	and and2_6  (result2[5], not_sel, option2[5]);
	and and2_7  (result2[6], not_sel, option2[6]);
	and and2_8  (result2[7], not_sel, option2[7]);
	and and2_9  (result2[8], not_sel, option2[8]);
	and and2_10 (result2[9], not_sel, option2[9]);
	and and2_11 (result2[10], not_sel, option2[10]);
	and and2_12 (result2[11], not_sel, option2[11]);
	and and2_13 (result2[12], not_sel, option2[12]);
	and and2_14 (result2[13], not_sel, option2[13]);
	and and2_15 (result2[14], not_sel, option2[14]);
	and and2_16 (result2[15], not_sel, option2[15]);
	and and2_17 (result2[16], not_sel, option2[16]);
	and and2_18 (result2[17], not_sel, option2[17]);
	and and2_19 (result2[18], not_sel, option2[18]);
	and and2_20 (result2[19], not_sel, option2[19]);
	and and2_21 (result2[20], not_sel, option2[20]);
	and and2_22 (result2[21], not_sel, option2[21]);
	and and2_23 (result2[22], not_sel, option2[22]);
	and and2_24 (result2[23], not_sel, option2[23]);
	and and2_25 (result2[24], not_sel, option2[24]);
	and and2_26 (result2[25], not_sel, option2[25]);
	and and2_27 (result2[26], not_sel, option2[26]);
	and and2_28 (result2[27], not_sel, option2[27]);
	and and2_29 (result2[28], not_sel, option2[28]);
	and and2_30 (result2[29], not_sel, option2[29]);
	and and2_31 (result2[30], not_sel, option2[30]);
	and and2_32 (result2[31], not_sel, option2[31]);
	
	
	or_32bit or1(result[31:0], result1[31:0], result2[31:0]);
endmodule