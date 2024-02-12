module CLA_16b (output [15:0] sum, output C16, input [15:0] a, b, input c_in);//Level 2 CLA
				wire [3:0]CARRIES;
				cll    cll1    (P3_0, G3_0, a[3:0], b[3:0], c_in);// Getting P3:0 and G3:0
				cll    cll2    (P7_4, G7_4, a[7:4], b[7:4], c_in);// Getting P7:4 and G7:4
				cll    cll3    (P11_8, G11_8, a[11:8], b[11:8], c_in);// Getting P11:8 and G11:8
				cll    cll4    (P15_12, G15_12, a[15:12], b[15:12], c_in);// Getting P15:12 and G15:12
				cll_16 cll16b_ (CARRIES[3:0], P3_0, G3_0, P7_4, G7_4, P11_8, G11_8, P15_12, G15_12, c_in);// Using previous 4 cll's outputs, generating C4,C8,C12,C16
			
				full_adder_4bit fa4b_1  (sum[3:0], cout0, a[3:0], b[3:0], c_in);
				full_adder_4bit fa4b_2  (sum[7:4], cout1, a[7:4], b[7:4], CARRIES[0]);
				full_adder_4bit fa4b_3  (sum[11:8], cout2, a[11:8], b[11:8], CARRIES[1]);
				full_adder_4bit fa4b_4  (sum[15:12], cout3, a[15:12], b[15:12], CARRIES[2]);
				
				or or1 (C16, CARRIES[3], CARRIES[3]);
endmodule
