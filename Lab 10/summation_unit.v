`timescale 1ns / 1ps
`default_nettype none

/* This module describes the 4-bit summation unit *
*for a carry-lookahead adder */

module summation_unit(S, P, C);

	/*declare output and input ports */
	output wire [15:0] S; //sum vector
	input wire [15:0] P, C; //propagate and carry vectors

	/*use dataflow to describe the gate-level activity*/
//	assign #2 S[0] = P[0] ^ C[0];
//	assign #2 S[1] = P[1] ^ C[1];
//	assign #2 S[2] = P[2] ^ C[2];
//	assign #2 S[3] = P[3] ^ C[3];
	
	assign #2 S = P ^ C;

endmodule