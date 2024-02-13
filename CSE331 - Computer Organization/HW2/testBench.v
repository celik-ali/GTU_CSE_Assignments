module testBench (); //Testbench for testing
	reg [31:0] a; // 32-bit num
	reg [31:0] b; // 32-bit num
	reg [2:0]sel; // 2-bit selectin(op-code)
	reg CLK; // clk signal
	reg reset; // reset signal
	wire [31:0] result; // Result of operations
	wire done; // Because we do not know how many cycles(loops) will occur in mod. We need to wait till all of them ends. Therefore we need this signal.
	
	alu alu1 (result, done, a, b, sel, CLK, reset);
	
	initial begin
		#0 a = 32'd42; b = 32'd9; sel = 000; CLK = 1'b0; reset = 1'b1; // Initialization of values
		#5 $display ("a: %b, b: %b, sel: %b, result: %b", a, b, sel,  result);
		#0 sel = 001;
		#5 $display ("a: %b, b: %b, sel: %b, result: %b", a, b, sel, result);
		#0 sel = 010;
		#5 $display ("a: %b, b: %b, sel: %b, result: %b", a, b, sel, result);
		#0 sel = 011;
		#5 $display ("a: %b, b: %b, sel: %b, result: %b", a, b, sel, result);
		#0 sel = 100;
		#5 $display ("a: %b, b: %b, sel: %b, result: %b", a, b, sel, result);
		#0 sel = 101;
		#5 $display ("a: %b, b: %b, sel: %b, result: %b", a, b, sel, result);
		#0 sel = 110;
		#5 $display ("a: %b, b: %b, sel: %b, result: %b", a, b, sel, result);
		reset = 1'b0; sel = 111;
		wait(done);
		$display ("a: %d, b: %d, sel: %b,  result: %d", a, b, sel,  result);
		$finish;// This one is not needed for results but needed so that there will be no need to click stop to see waves in simulator. Because of this simulator pops up at the begining. When we say no to it, we can see the waves too.
	end 
	always //Making square clk signals for 1ns
	begin
	#1
	CLK = ~CLK;
	end

endmodule 