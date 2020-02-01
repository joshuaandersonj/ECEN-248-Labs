`timescale 1ns / 1ps
`default_nettype none

/* This module describes the 4-bit carry-lookahead unit *
*for a carry-lookahead adder */

module carry_lookahead_unit(C, G, P, C0);

	/*declare output and input ports */
	output wire [4:1] C; //C4, C3, C2, C1
	input wire [3:0] G, P; //3-bit wires //generates and propagates
	input wire C0; //input carry

	/*use dataflow to describe the gate-level activity*/
	assign #4 C[1] = G[0] | ( P[0] & C0 );
	assign #4 C[2] = G[1] | ( G[0] & P[1] ) | ( C0 & P[0] & P[1] );
	assign #4 C[3] = G[2] | ( G[1] & P[2] ) | ( G[0] & P[1] & P[2] );
    assign #4 C[4] = G[3] | ( G[2] & P[3] ) | ( G[1] & P[2] & P[3] ) | ( G[0] & P[1] & P[2] & P[3] ) | ( C0 & P[0] & P[1] & P[2] & P[3] );

//	assign C[1] = G[0] | (P[0] & C0);
//	assign C[2] = G[1] | (P[1] & C[1]);
//	assign C[3] = G[2] | (P[2] & C[2]);
//	assign C[4] = G[3] | (P[3] & C[3]);




endmodule