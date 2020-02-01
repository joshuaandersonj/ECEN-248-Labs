`timescale 1ns / 1ps

module d_latch(Q, notQ, En, D);

    output wire Q, notQ;
    input wire En, D;
    
    //intermediate nets
    //nandSEN is the output of NAND(S,EN)
    //nandREN is the output of NAND(R,EN)
    //delay of nand0 is 2ns.
    wire nandDEN, nandnotDEN, notD;
    not #2 not0(notD, D);
    nand #2 nand0(Q, nandDEN, notQ);
    nand #2 nand1(notQ, nandnotDEN, Q);
    nand #2 nand2(nandDEN, D, En);
    nand #2 nand3(nandnotDEN, notD, En);
endmodule