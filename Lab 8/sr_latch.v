`timescale 1ns / 1ps // delay unit is 1ns

module sr_latch(Q, notQ, En, S, R);

    output wire Q, notQ;
    input wire En, S, R;
    //intermediate nets
    //nandSEN is the output of NAND(S,EN)
    //nandREN is the output of NAND(R,EN)
    //delay of nand0 is 2ns.
    wire nandSEN, nandREN;
    nand #2 nand2(nandSEN, S, En);
    nand #2 nand3(nandREN, R, En);
    nand #2 nand0(Q, nandSEN, notQ);
    nand #2 nand1(notQ, nandREN, Q);
    
endmodule