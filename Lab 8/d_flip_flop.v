`timescale 1ns / 1ps

module d_flip_flop(Q, notQ, Clk, D);

    output wire Q, notQ;
    input wire Clk, D;
    
    //intermediate nets
    wire notClk, notnotClk;
    wire Qm;
    wire notQm;
    not #2 not0(notClk, Clk);
    not #2 not1(notnotClk, notClk);
    d_latch master0(Qm, notQm, notClk, D);
    d_latch slave0(Q, notQ, notnotClk, Qm);
    
    
endmodule