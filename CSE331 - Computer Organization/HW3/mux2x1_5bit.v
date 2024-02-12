module mux2x1_5bit(output [4:0] result, input [4:0] option1, option2, input sel);
	wire [4:0] result1;
	wire [4:0] result2;
	not not1 (not_sel, sel);
	
	and and1  (result1[0], sel, option1[0]);
	and and2  (result1[1], sel, option1[1]);
	and and3  (result1[2], sel, option1[2]);
	and and4  (result1[3], sel, option1[3]);
	and and5  (result1[4], sel, option1[4]);
	
	and and2_1  (result2[0], not_sel, option2[0]);
	and and2_2  (result2[1], not_sel, option2[1]);
	and and2_3  (result2[2], not_sel, option2[2]);
	and and2_4  (result2[3], not_sel, option2[3]);
	and and2_5  (result2[4], not_sel, option2[4]);
	
		
	or_4bit or1(result[3:0], result1[3:0], result2[3:0]);
	or or2(result[4], result1[4], result2[4]);
endmodule