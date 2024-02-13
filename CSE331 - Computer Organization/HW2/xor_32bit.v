module xor_32bit(output [31:0]xor32_out, input [31:0]a, b); //Xor operation occurs for 32-bit numbers
			xor_16bit xor16b_1(xor32_out[15:0], a[15:0], b[15:0]);
			xor_16bit xor16b_2(xor32_out[31:16], a[31:16], b[31:16]);
endmodule
