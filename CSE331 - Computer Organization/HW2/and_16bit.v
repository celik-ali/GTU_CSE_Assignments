module and_16bit(output [15:0]and16_out, input [15:0]a, b);//and operation occurs for 16-bits numbers
			and_4bit and4b_0(and16_out[3:0], a[3:0], b[3:0]);
			and_4bit and4b_1(and16_out[7:4], a[7:4], b[7:4]);
			and_4bit and4b_2(and16_out[11:8], a[11:8], b[11:8]);
			and_4bit and4b_3(and16_out[15:12], a[15:12], b[15:12]);
			
endmodule
