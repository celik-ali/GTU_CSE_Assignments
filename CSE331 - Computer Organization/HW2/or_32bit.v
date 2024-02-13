module or_32bit(output [31:0]or32_out, input [31:0]a, b);//or operation occurs for 32-bit numbers
			or_16bit or16b_1(or32_out[15:0], a[15:0], b[15:0]);
			or_16bit or16b_2(or32_out[31:16], a[31:16], b[31:16]);			
endmodule
