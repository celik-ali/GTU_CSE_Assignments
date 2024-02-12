module full_adder_4bit (output [3:0] sum, output cout, input [3:0] a, input [3:0] b, input cin); //Full adder for a 4 bit design
	
		full_adder fadd1(sum[0], cout0, a[0], b[0], cin);
		full_adder fadd2(sum[1], cout1, a[1], b[1], cout0);
		full_adder fadd3(sum[2], cout2, a[2], b[2], cout1);
		full_adder fadd4(sum[3], cout , a[3], b[3], cout2);
		
endmodule
