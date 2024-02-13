module or_4bit (output [3:0] or_out, input [3:0] a, input [3:0] b);//or operation occurs for 4-bits numbers
	or or0 (or_out[0], a[0], b[0]);
	or or1 (or_out[1], a[1], b[1]);
	or or2 (or_out[2], a[2], b[2]);
	or or3 (or_out[3], a[3], b[3]);

endmodule
