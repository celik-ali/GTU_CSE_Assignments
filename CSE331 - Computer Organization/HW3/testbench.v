module testbench();
		reg clk;
		integer i;
		mips m (clk);
		initial begin
			clk=0;
			for (i = 0; i < 32; i = i + 1) begin
            #5 clk = 1; // Set clock high
            #5 clk = 0; // Set clock low
        end
		end

endmodule