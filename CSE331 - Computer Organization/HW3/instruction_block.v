module instruction_block(output reg[31:0] instruction, input [31:0] PC);
			reg [31:0] instructions [31:0];
		always @(posedge PC) begin
		#1
			$readmemb("instructions.mem", instructions);
			instruction = instructions[PC];
		end

endmodule
