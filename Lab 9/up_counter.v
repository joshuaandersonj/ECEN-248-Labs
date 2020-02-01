`timescale 1 ns / 1 ps //1nsdelay unit
`default_nettype none
module up_counter(Count, Carry2, En, Clk, Rst);

input wire En, Clk, Rst;
output reg [2:0] Count;
output wire Carry2;

wire [2:0] Carry, Sum; //intermediate nets

//Half adders instantiated to produce outputs
Threebit_counter UC1(Sum, Carry2, Count, En);



always@(posedge Clk or posedge Rst)
    if (Rst)
        Count <=0;//Reset Count
    else
        Count <= Sum;
        
endmodule

module Threebit_counter(Sum, Carry2, Count, En);

    input wire En;
    input wire [2:0] Count;
    output [2:0]Sum;
    output wire Carry2;
    wire [2:0] Carry;
    half_adder half_adder0(Sum[0], Carry[0], En, Count[0]);
    half_adder half_adder1(Sum[1], Carry[1], Carry[0], Count[1]);
    half_adder half_adder2(Sum[2], Carry[2], Carry[1], Count[2]);

    assign Carry2 = Carry[2];
  
endmodule
    