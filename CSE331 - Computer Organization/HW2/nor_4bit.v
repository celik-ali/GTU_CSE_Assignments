module nor_4bit (output [3:0] nor_out, input [3:0] a, input [3:0] b);//nor operation occurs for 4-bits numbers
	nor nor0 (nor_out[0], a[0], b[0]);
	nor nor1 (nor_out[1], a[1], b[1]);
	nor nor2 (nor_out[2], a[2], b[2]);
	nor nor3 (nor_out[3], a[3], b[3]);

endmodule
