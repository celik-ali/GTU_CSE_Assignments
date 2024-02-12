module cll_16 (output [3:0]CARRIES, input P3_0, G3_0, P7_4, G7_4, P11_8, G11_8, P15_12, G15_12, c_in); //Level 2 CLL

	and and1 (and1_out, P3_0, c_in); //P3:0C0
	or  or1  (CARRIES[0], G3_0, and1_out); // C4 = G3:0 + P3:0C0
	
	and and2 (and2_out, P7_4, CARRIES[0]); //P3:0C4
	or  or2  (CARRIES[1], G7_4, and2_out); // C8 = G7_4 + P7_4C4
	
	and and3 (and3_out, P11_8, CARRIES[1]); //P3:0C8
	or  or3  (CARRIES[2], G11_8, and3_out); // C12 = G11_8 + P11_8C8
	
	and and4 (and4_out, P15_12, CARRIES[2]); //P3:0C12
	or  or4  (CARRIES[3], G15_12, and4_out); // C16 = G15_12 + P15_12C12
	
endmodule
