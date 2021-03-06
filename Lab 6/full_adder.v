`timescale 1ns / 1ps
`default_nettype none
/*This module describes the gate-level model of  *
 *a full-adder in Verilog                        */
 
 module full_adder(S, Cout, A, B, Cin);
 
    /*declare output and input ports*/
    output wire S, Cout;
    input wire A, B, Cin; //1-bit wires
    
    /*declare internal nets*/
    wire andAB, andBCin, andACin; //1-bit wires
    
    /*use dataflow to descibe the gate-level activity*/
    assign S = A ^ B ^ Cin; //A XOR B XOR Cin
    assign andAB = A & B; // A AND B
    assign andBCin = B & Cin; // B AND Cin
    assign andACin = A & Cin; // A AND Cin
    assign Cout = andAB | andBCin | andACin; //AB + BCin + ACin = Cout
    
endmodule