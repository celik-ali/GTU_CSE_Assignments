module and_4bit (output [3:0] and_out, input [3:0] a, input [3:0] b);//and operation occurs for 4-bits numbers
	and and0 (and_out[0], a[0], b[0]);
	and and1 (and_out[1], a[1], b[1]);
	and and2 (and_out[2], a[2], b[2]);
	and and3 (and_out[3], a[3], b[3]);

endmodule
