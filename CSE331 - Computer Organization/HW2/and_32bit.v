module and_32bit(output [31:0]and32_out, input [31:0]a, b);//and operation occurs for 32-bit numbers
			and_16bit and16b_1(and32_out[15:0], a[15:0], b[15:0]);
			and_16bit and16b_2(and32_out[31:16], a[31:16], b[31:16]);
						
endmodule
