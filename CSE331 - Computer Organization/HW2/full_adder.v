module full_adder(output sum, cout, input a, b, cin); // Full adder for a 1 bit design
	xor xor1 (xor1_out, a, b);
	xor xor2 (sum, xor1_out, cin);
	and and1 (and1_out, xor1_out, cin);
	and and2 (and2_out, a, b);
	or or1 	(cout, and1_out, and2_out);

endmodule
