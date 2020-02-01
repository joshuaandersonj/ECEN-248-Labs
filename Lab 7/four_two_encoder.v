`timescale 1ns / 1ps
`default_nettype none
/*This module describes a 2:4 encoder using behavioral constructs in Verilog HDL. */

/*module interface for the 4:2 encoder*/
module four_two_encoder(
    input wire [3:0] W,
    output wire zero,
    output reg [1:0] Y
);

    /*can mix levels of abstraction!*/
    assign zero = (W == 4'b0000);
    //a zero test! notice the use of == rather than =
    
    /*behavioral portion*/
    always@(*)
        begin
            case(W)
                4'b0001: Y = 2'b00;//2'b signifies a 2-bit binary value
                4'b0010: Y = 2'b01;
                4'b0100: Y = 2'b10;
                4'b1000: Y = 2'b11;
                default: Y = 2'bXX; //default covers the cases not listed!
                                    //2'bXX means 2-bits of don't cares!
            endcase
        end
        
endmodule