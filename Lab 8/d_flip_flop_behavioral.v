`timescale 1ns / 1ps

module d_flip_flop_behavioral(
    output reg Q, 
    output wire notQ,
    input wire D,
    input wire Clk
);
    //describe behavior of D flip flop
    //posedge means positive (rising edge
    always@(posedge Clk)
        Q<=D;
        
        assign notQ = ~Q;
endmodule