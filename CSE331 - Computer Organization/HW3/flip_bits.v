module flip_bits (output [31:0] result, input [31:0]a); //Flips bits of 32-bit number for two's complement and subtraction.

	not not1  (result[0], a[0]);
	not not2  (result[1], a[1]);
	not not3  (result[2], a[2]);
	not not4  (result[3], a[3]);
	not not5  (result[4], a[4]);
	not not6  (result[5], a[5]);
	not not7  (result[6], a[6]);
	not not8  (result[7], a[7]);
	not not9  (result[8], a[8]);
	not not10 (result[9], a[9]);
	not not11 (result[10], a[10]);
	not not12 (result[11], a[11]);
	not not13 (result[12], a[12]);
	not not14 (result[13], a[13]);
	not not15 (result[14], a[14]);
	not not16 (result[15], a[15]);
	not not17 (result[16], a[16]);
	not not18 (result[17], a[17]);
	not not19 (result[18], a[18]);
	not not20 (result[19], a[19]);
	not not21 (result[20], a[20]);
	not not22 (result[21], a[21]);
	not not23 (result[22], a[22]);
	not not24 (result[23], a[23]);
	not not25 (result[24], a[24]);
	not not26 (result[25], a[25]);
	not not27 (result[26], a[26]);
	not not28 (result[27], a[27]);
	not not29 (result[28], a[28]);
	not not30 (result[29], a[29]);
	not not31 (result[30], a[30]);
	not not32 (result[31], a[31]);

endmodule
