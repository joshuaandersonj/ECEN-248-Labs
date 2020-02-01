`timescale 1ns / 1ps
`default_nettype none

/* This is the top-level module for a 4-bit *
*carry-lookahead adder */

module carry_lookahead_4bit(Cout, S, X, Y, Cin);

	/*declare output and input ports */
	output wire Cout; //C_4 for a 4-bit adder
	output wire [3:0] S; //final 4-bit sum vector
	input wire [3:0] X, Y; //the 4-bit addends
	input wire Cin; //input carry!

	//internal nets
	wire [3:0] G, P;
	wire [4:0] C;

	assign C[0] = Cin;
	
	generate_propagate_unit GPUnit(G, P, X, Y);
	
	carry_lookahead_unit CLU(C[4:1], G, P, C[0]);
	
	summation_unit SU(S, P, C[3:0]);
	
	assign Cout = C[4];
	

endmodule