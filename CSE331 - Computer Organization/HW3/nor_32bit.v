module nor_32bit(output [31:0]nor32_out, input [31:0]a, b);//nor operation occurs for 32-bit numbers
			nor_16bit nor16b_1(nor32_out[15:0], a[15:0], b[15:0]);	
			nor_16bit nor16b_2(nor32_out[31:16], a[31:16], b[31:16]);
					
endmodule
