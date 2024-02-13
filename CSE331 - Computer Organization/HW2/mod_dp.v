module mod_dp(output [31:0] result, output comp_rest, input CLK, s, we, input [31:0] a, b);
	
reg [31:0] temp; // Necessary regs for assigning values to the outputs.
reg [31:0] sub_res;
reg comp_temp;

always @(posedge CLK) begin //According to control_unit's output we are handling subtraction, comparison and assigning operations.
	if(we) begin
		temp <= a;
		sub_res <= 3;
	end else if(s) begin
		if (temp >= b) begin
			temp <= temp - b;
			comp_temp <= 0;
			sub_res <= temp;
		end else begin
			comp_temp <= 1;
			sub_res <= temp;
		end
	end
end

assign result = sub_res;// Assigning temp reg's values to the outputs of t
assign comp_rest = comp_temp;

endmodule
