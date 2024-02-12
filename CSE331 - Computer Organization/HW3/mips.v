/*
I try too many times but Ik couldnt find where I am making mistake. According to clk signal PC increments each 
time as you can see in sim. But submodules does not implement even though always signalss
*/

module mips(input clk);
    reg  [31:0] PC;
    wire [31:0] readData1, readData2, mux1_result, signExtended, shifted, ALUres, mem_out, lastMux;
    wire  [31:0] writeData;
    wire [31:0] instruction;
	 wire [4:0] writeReg; 
    wire regDst, branch, memRead, memWrite, ALUsrc, regWrite, jump, byteOperations, move, zeroB;
    wire [2:0] ALUop, ALUCtr;

	 initial begin
        PC = 32'd0;  // Initialize PC_out at the start of simulation
    end

    always @(posedge clk) begin
        PC <= PC + 1;  // Increment PC_out on every rising edge of clk
		  $display("%d", PC);
    end


		instruction_block 	InstB(instruction, PC);
		control_unit 			ContU(regDst, branch, memRead, memWrite, ALUsrc, regWrite, jump, byteOperations, move, ALUop, instruction[31:26]);
		mux2x1_5bit  			muxLeft(writeReg, instruction[15:11], instruction[20:16], regDst);
		register_block 		RegB(readData1, readData2, byteOperations, regWrite, writeData, instruction[25:21], instruction[20:16], writeReg);

		sign_extend 			signExt(signExtended, instruction[15:0]);
		shift_left_2 			shiftLeft(shifted, signExtended);
		alu_control 			alu_cont(ALUCtr, instruction[5:0], ALUop);
		
		mux2x1					muxRight(mux1_result, signExtended, readData2, ALUsrc);
		alu 						aluMips(ALUres, zeroB, readData1, mux1_result, ALUCtr);
		memory_block			MemB(mem_out,byteOperations,ALUres[17:0],readData2,memRead, memWrite);
		mux2x1					muxLast(lastMux, mem_out, ALUres, memRead);
		mux2x1					muxMove(writeData, readData1, lastMux, move);

endmodule

