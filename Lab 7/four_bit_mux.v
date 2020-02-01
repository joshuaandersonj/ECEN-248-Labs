`timescale 1ns / 1ps
`default_nettype none
/* This module describes a 1−bit wide multiplexerusing behavioral constructs ∗
 * in Verilog HDL. 															 */

module four_bit_mux(Y, A, B, S); //define the module name and its interface

	/* declare output and input ports */
	output reg [3:0] Y; // declare output of type reg 4 bits wide since it will
						// be modified in an always block!
	input wire [3:0] A, B; // declare inputs of type wire 4 bits wide
					    // wires can drive regs in behavioral statements
	input wire S; //select is still 1 bit wide

	always@(A or B or S) // always block which triggers whenever A, B, or S changes
		begin // block constructs together
	/*1’b0 represents a 1−bit binary value of 0 */
			if(S == 1'b0) // double equals are used for comparisons
				Y = A; // drive Y with A
			else
				Y = B; // instead drive Y with B
            end
 
 endmodule // designate end of module