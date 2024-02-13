module slt_32bit(output [31:0]slt32_out, input [31:0]a, b);// Set Less Than design for 32 bit output. LB is 1 or 0 to tell comparison result
			wire [31:0] res_sub;
			wire cout;
			adder sub32bit	(res_sub, cout, a, b, 3'b110);
			
			and fill_res1  (slt32_out[0], res_sub[31],res_sub[31]);
			and fill_res2  (slt32_out[1], 1'b0, 1'b0);
			and fill_res3  (slt32_out[2], 1'b0, 1'b0);
			and fill_res4  (slt32_out[3], 1'b0, 1'b0);
			and fill_res5  (slt32_out[4], 1'b0, 1'b0);
			and fill_res6  (slt32_out[5], 1'b0, 1'b0);
			and fill_res7  (slt32_out[6], 1'b0, 1'b0);
			and fill_res8  (slt32_out[7], 1'b0, 1'b0);
			and fill_res9  (slt32_out[8], 1'b0, 1'b0);
			and fill_res10 (slt32_out[9], 1'b0, 1'b0);
			and fill_res11 (slt32_out[10], 1'b0, 1'b0);
			and fill_res12 (slt32_out[11], 1'b0, 1'b0);
			and fill_res13 (slt32_out[12], 1'b0, 1'b0);
			and fill_res14 (slt32_out[13], 1'b0, 1'b0);
			and fill_res15 (slt32_out[14], 1'b0, 1'b0);
			and fill_res16 (slt32_out[15], 1'b0, 1'b0);
			and fill_res17 (slt32_out[16], 1'b0, 1'b0);
			and fill_res18 (slt32_out[17], 1'b0, 1'b0);
			and fill_res19 (slt32_out[18], 1'b0, 1'b0);
			and fill_res20 (slt32_out[19], 1'b0, 1'b0);
			and fill_res21 (slt32_out[20], 1'b0, 1'b0);
			and fill_res22 (slt32_out[21], 1'b0, 1'b0);
			and fill_res23 (slt32_out[22], 1'b0, 1'b0);
			and fill_res24 (slt32_out[23], 1'b0, 1'b0);
			and fill_res25 (slt32_out[24], 1'b0, 1'b0);
			and fill_res26 (slt32_out[25], 1'b0, 1'b0);
			and fill_res27 (slt32_out[26], 1'b0, 1'b0);
			and fill_res28 (slt32_out[27], 1'b0, 1'b0);
			and fill_res29 (slt32_out[28], 1'b0, 1'b0);
			and fill_res30 (slt32_out[29], 1'b0, 1'b0);
			and fill_res31 (slt32_out[30], 1'b0, 1'b0);
			and fill_res32 (slt32_out[31], 1'b0, 1'b0);

endmodule
