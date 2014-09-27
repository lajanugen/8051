`timescale 1ns / 1ps

module test;

	// Inputs
	reg rst;
	reg clk;

	// Outputs
	wire [7:0] acc;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.rst(rst), 
		.clk(clk), 
		.acc(acc)
	);

	initial begin
		// Initialize Inputs
		rst = 1;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#200;
        
        rst = 0;
		// Add stimulus here

	end

  always
    #20 clk = ~clk;

    
endmodule

