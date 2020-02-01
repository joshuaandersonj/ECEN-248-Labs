`timescale 1ns / 1ps
`default_nettype none
/* This Verilog module descibes a 4-bit addition/subtraction  *
 * unit using full-adder modules which have already been      *
 * designed and tested.                                       */
 
module add_sub(
    /*desclare output and input ports*/
    output wire [3:0] Sum, //4-bit result
    output wire Overflow, //1-bit wire for overflow
    input wire [3:0] opA, opB, //4-bit operands
    input wire opSel//opSel = 1 for subtract
 );
 
    /*declare internal nets*/
    wire [3:0] notB;
    wire c0, c1, c2, c3;
    
    /*create complement logic*/
    assign notB[0] = opB[0] ^ opSel;//if opSel == 1, complement
    //fill in rest
    assign notB[1] = opB[1] ^ opSel;
    assign notB[2] = opB[2] ^ opSel;
    assign notB[3] = opB[3] ^ opSel;
    /*wire up full adders to create a ripple carry adder*/
    full_adder adder0(Sum[0], c0, opA[0], notB[0], opSel);
    //Something here
    full_adder adder1(Sum[1], c1, opA[1], notB[1], c0);
    full_adder adder2(Sum[2], c2, opA[2], notB[2], c1);
    full_adder adder3(Sum[3], c3, opA[3], notB[3], c2);
    
    /*overflow detection logic*/
    assign Overflow = c3 ^ c2;// finish line
    
 endmodule