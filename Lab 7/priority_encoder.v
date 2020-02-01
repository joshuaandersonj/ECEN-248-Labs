module priority_encoder(
    input wire [3:0] W,
    output reg [1:0] Y,
    output wire zero
);

    /*can mix levels of abstraction!*/
    assign zero = (W == 4'b0000);
    //a zero test! notice the use of == rather than =
    
    /*behavioral portion*/
    always@(*)
        begin
            casex(W)
                4'b0001: Y = 2'b00;//2'b signifies a 2-bit binary value
                4'b001X: Y = 2'b01;
                4'b01XX: Y = 2'b10;
                4'b1XXX: Y = 2'b11;
                default: Y = 2'bXX; //default covers the cases not listed!
                                    //2'bXX means 2-bits of don't cares!
            endcase
        end
        
endmodule