module CLA_32bit (output [31:0]sum, output [31:0]p, output [31:0]g, output c_out, input [31:0]a, b, input c_in);
		CLA_16bit cla16b_1(sum[15:0], p[15:0], g[15:0], c_out16_1, a[15:0], b[15:0], c_in);
		CLA_16bit cla16b_2(sum[31:16], p[31:16], g[31:16], c_out, a[31:16], b[31:16], c_out16_1);
endmodule
