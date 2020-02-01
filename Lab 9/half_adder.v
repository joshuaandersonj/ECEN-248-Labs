`timescale 1 ns / 1 ps //1nsdelay unit
`default_nettype none
module half_adder(S, Cout, A, B);

    input wire A, B;
    output wire S, Cout;
    
    assign S = A ^ B;
    assign Cout = A & B;
    
endmodule