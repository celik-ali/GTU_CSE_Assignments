module nor_16bit(output [15:0]nor16_out, input [15:0]a, b);//nor operation occurs for 16-bits numbers
			nor_4bit nor4b_0(nor16_out[3:0], a[3:0], b[3:0]);
			nor_4bit nor4b_1(nor16_out[7:4], a[7:4], b[7:4]);
			nor_4bit nor4b_2(nor16_out[11:8], a[11:8], b[11:8]);
			nor_4bit nor4b_3(nor16_out[15:12], a[15:12], b[15:12]);
			
endmodule
