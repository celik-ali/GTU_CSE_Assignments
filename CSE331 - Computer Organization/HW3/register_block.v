module register_block(
		 output reg [31:0] read_data1, read_data2, 
		 input byte_ops, regWrite, 
		 input [31:0] write_data, 
		 input [4:0] read_reg1, read_reg2, write_reg
);
//Tested working. At the end is the testbench
	reg [31:0] registers [31:0];
	
	always @(posedge read_reg1) begin
	#2
	$readmemb("register.mem", registers);
	read_data1 = registers[read_reg1];
	read_data2 = registers[read_reg2];
	if(regWrite == 1) begin
		#1
		registers[write_reg] = write_data;
		$writememb("register.mem", registers);
	end
	end




endmodule
