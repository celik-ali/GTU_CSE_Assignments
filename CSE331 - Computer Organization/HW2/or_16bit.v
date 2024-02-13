module or_16bit(output [15:0]or16_out, input [15:0]a, b);//or operation occurs for 16-bits numbers
			or_4bit or4b_0(or16_out[3:0], a[3:0], b[3:0]);
			or_4bit or4b_1(or16_out[7:4], a[7:4], b[7:4]);
			or_4bit or4b_2(or16_out[11:8], a[11:8], b[11:8]);
			or_4bit or4b_3(or16_out[15:12], a[15:12], b[15:12]);
			
endmodule
