`timescale 1ns / 1ps
`default_nettype none
/*This module describes a 2:4 decoder using behavioral constructs in Verilog HDL. */

/*module interface for the 2:4 decoder */
module two_four_decoder(
    input wire [1:0] W,
    input wire En,
    output reg [3:0] Y
);

    always@(En or W)
      begin
        if(En == 1'b1) //can put case within if clause!
            case(W) //selection based on W
                2'b00: Y = 4'b0001; //4'b signifies a 4-bit binary value
                2'b01: Y = 4'b0010;
                2'b10: Y = 4'b0100;
                2'b11: Y = 4'b1000;// light up Y[3]
            endcase
        else
            Y = 4'b0000; //disable all outputs
      end
      
endmodule