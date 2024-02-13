module adder (output [31:0] sum, output C32, input [31:0] a, b, input [2:0]sel);//32bit adder which does addition and subtraction operations together according to given selection bit
			wire [31:0] tempN;//Necessary wires
			wire [31:0] flipped;
			wire [31:0] res_add;
			wire [31:0] res_sub;
			wire [31:0] result_mux;

			
			CLA_16b CLA16b_1 (res_add[15:0], C16, a[15:0], b[15:0], 1'b0);
			CLA_16b CLA16b_2 (res_add[31:16], C32, a[31:16], b[31:16], C16);
			
			temp_gen  temp1 (tempN, b);
			flip_bits flip1 (flipped, tempN);
			CLA_16b CLA16b_3 (res_sub[15:0], C17, a[15:0], flipped[15:0], 1'b1);
			CLA_16b CLA16b_4 (res_sub[31:16], C33, a[31:16], flipped[31:16], C17);
			
			mux3x1   mux  (result_mux, res_add, res_sub, sel);
			or_32bit or32 (sum, result_mux, result_mux);  
endmodule
