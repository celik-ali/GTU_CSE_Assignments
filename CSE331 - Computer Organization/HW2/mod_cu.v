module mod_cu(output reg we, s, op_done, input CLK, input reset, input comp_res); //Control unit of mod operation
	parameter INI = 2'b00;//States
	parameter SUB = 2'b01;
	parameter RES = 2'b11;
	
	reg [1:0] curr_state, next_state;//

always @(posedge CLK) begin // Giving state changes order
	if (reset)
		curr_state <= INI;
	else
		curr_state <= next_state;
end

always @(posedge CLK) // Managing changes according to current state and datapath return values.
	begin
		case(curr_state)
			INI: begin
			next_state <= SUB;
			end
			SUB:begin
				if(comp_res) // According to comparison result condition proceed
				next_state <= RES;
				else 
				next_state <= SUB;				
			end
			RES: 
			begin
			end
		endcase
	
	end

	
always @(posedge CLK) // Outputs generated
	begin
	s = 1'b0;
	we = 1'b0;
	op_done = 1'b0;
	case(curr_state)
	INI: 	begin
		s = 1'b0;
		we = 1'b1;
		end
	
	SUB: begin
		s = 1'b1;
		we = 1'b0;
		end
	RES: begin
			op_done =1'b1; // If operation is done returns 1 to done in testbench.
		  end	
	endcase
	end

endmodule
