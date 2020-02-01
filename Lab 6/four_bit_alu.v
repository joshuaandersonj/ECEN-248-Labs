`timescale 1ns / 1ps
`default_nettype none

module four_bit_alu(
    output wire [3:0] Result, //4-bitoutput
    output wire Overflow, //1-bit signal for overflow
    input wire [3:0] opA, opB, //4-bit operands
    /*ctrl  | operation*
     * 00   | AND      *
     * 01   | ADD      *
     * 10   | AND      *
     * 11   | SUB      */
    input wire [1:0] ctrl //2-bit operation select
);
     //internal nets
     wire [3:0] andAB;
     wire [3:0] addsubAB;
     wire addsubOverflow;
     //AND Function
     assign andAB = opA & opB;
     
     add_sub add_sub0(addsubAB, addsubOverflow, opA, opB, ctrl[1]);//instantiate adder subtractor
     
     four_bit_mux four_bit_mux0(Result, andAB, addsubAB, ctrl[0]);//instantiate mux
     assign Overflow = addsubOverflow & ctrl[0];
     
 endmodule