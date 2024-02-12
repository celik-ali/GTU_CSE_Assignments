module xor_16bit(output [15:0]xor16_out, input [15:0]a, b);//xor occurs for 16-bits numbers
			xor_4bit xor4b_0(xor16_out[3:0], a[3:0], b[3:0]);
			xor_4bit xor4b_1(xor16_out[7:4], a[7:4], b[7:4]);
			xor_4bit xor4b_2(xor16_out[11:8], a[11:8], b[11:8]);
			xor_4bit xor4b_3(xor16_out[15:12], a[15:12], b[15:12]);
			
endmodule
