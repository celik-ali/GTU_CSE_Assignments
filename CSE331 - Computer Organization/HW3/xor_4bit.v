module xor_4bit (output [3:0] xor_out, input [3:0] a, input [3:0] b);//xor operation occurs for 4-bits numbers
	xor xor0 (xor_out[0], a[0], b[0]);
	xor xor1 (xor_out[1], a[1], b[1]);
	xor xor2 (xor_out[2], a[2], b[2]);
	xor xor3 (xor_out[3], a[3], b[3]);

endmodule
