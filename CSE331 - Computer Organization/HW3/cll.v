module cll (output px_y, output gx_y, input [3:0]a, b, input c_in);//Carry Lookahead Logic(cll) Design for 4 bit
			wire [3:0]c_out;
			wire [3:0] g;
			wire [3:0] p; 
			xor prop0  (p[0], a[0], b[0]); //P0 is generated
			and gen0   (g[0], a[0], b[0]);  //G0 is generated
			and and1   (and1_out, p[0], c_in); //p0c0
			or  or1    (c_out[0], g[0], and1_out);//C1 = g0 + p0c0
			
			xor prop1  (p[1], a[1], b[1]);//P1 is generated
			and gen1   (g[1], a[1], b[1]);//G1 is generated
			and andt1  (andt1_out, p[1], p[0]); //p1p0
			and and2   (and2_out, c_in, andt1_out);//p1p0c0
			and and3   (and3_out, p[1], g[0]);//p1g0
			or  ort1   (ort1_out, and2_out, andt3_out);// p1p0c0 + p1g0
			or  or2    (c_out[1], ort1_out, g[1]); //c2 = g1 + p1p0c0 + p1g0
			
			xor prop2  (p[2], a[2], b[2]);//P2 is generated
			and gen3   (g[2], a[2], b[2]); //G2 is generated
			and andt2  (andt2_out, p[2], p[1]);//p2p1
			and andt3  (andt3_out, p[0], c_in);//p0c0
			and and4   (and4_out, andt2_out, andt3_out);//p2p1p0c0
			and andt4  (andt4_out, p[2], p[1]); //p2p1
			and and5   (and5_out, andt4_out, g[0]);//p2p1g0
			and and6   (and6_out, p[2], g[1]);//p2g1
			or  ort2   (ort2_out, g[2], and6_out);// p2g1 + g2
			or  ort3   (ort3_out, and4_out, and5_out);// p2p1p0c0 + p2p1g0
			or  or3    (c_out[2], ort2_out, ort3_out);// c3 = g2 + p2g1 + p2p1g0 + p2p1p0c0
			
			xor prop3  (p[3], a[3], b[3]);//P3 is generated
			and gen4   (g[3], a[3], b[3]); //G3 is generated
			and andt5  (andt5_out, p[3],p[2]);//p3p2
			and andt6  (andt6_out, p[1],p[0]);//p1p0
			and andt7  (px_y, andt5_out, andt6_out);//p3p2p1p0 a.k.a P3:0
			and and7   (and7_out, p3_0, c_in);//p3p2p1p0c0
			and andt9  (andt9_out, p[3], p[2]);//p3p2
			and andt10 (andt10_out, p[1],g[0]);//p1g0
			and and8   (and8_out, andt9_out, andt10_out);//p3p2p1g0
			and andt11 (andt11_out, p[3], p[2]);//p3p2
			and and9   (and9_out, andt11_out, g[1]);//p3p2g1
			and and10  (and10_out, p[3], g[2]); //p3g2
			or  ort4   (ort4_out, and10_out, g[3]); // g3 + p3g2
			or  ort5   (ort5_out, and9_out, and8_out); // p3p2g1 + p3p2p1g0
			or  ort6   (gx_y, ort5_out, ort4_out); // g3 + p3g2 + p3p2g1 + p3p2p1g0 a.k.a G3:0
			or  or4    (c_out[3], gx_y, and7_out);// c4 = g3 + p3g2 + p3p2g1 + p3p2p1g0 + p3p2p1p0c0
			
endmodule
