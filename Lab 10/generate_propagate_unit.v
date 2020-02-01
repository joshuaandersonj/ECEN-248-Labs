`timescale 1ns / 1ps
`default_nettype none

/* This module describes the Carry Generate/Propagate Unit *
*for 4-bit carry-lookahead addition */

module generate_propagate_unit(G, P, X, Y);

	/*declare output and input ports */
	output wire [15:0] G, P; //4-bit wires
	input wire [15:0] X, Y; //4-bit wires

	/*use dataflow to describe the gate-level activity*/
//	assign #2 G[0] = X[0] & Y[0];
//  assign #2 G[1] = X[1] & Y[1];
//  assign #2 G[2] = X[2] & Y[2];
//	assign #2 G[3] = X[3] & Y[3];
//	assign #2 P[0] = X[0] ^ Y[0];
//	assign #2 P[1] = X[1] ^ Y[1];
//	assign #2 P[2] = X[2] ^ Y[2];
//	assign #2 P[3] = X[3] ^ Y[3];
	
	assign #2 G = X & Y;
	assign #2 P = X ^ Y;
	
endmodule