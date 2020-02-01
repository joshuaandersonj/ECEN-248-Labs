`timescale 1ns / 1ps

module combination_lock_fsm(

   /*for ease of debugging, output state*/
	output reg [2:0] state,
   output wire [3:0] Lock, // asserted when locked
   input wire Key1, Key2, //Unlock buttons 0 and 1 respectively
   input wire [3:0] Password, //indicate number
   input wire Clk, Reset //clock and reset
);
parameter  S0=3'b000,
           S1=3'b001,
           S2=3'b010,
           S3=3'b011,
           S4=3'b100;  
  reg [2:0] nextState;
  always@(*)
case(state)
  S0: begin
      
      if(Key1 == 1 && Password == 4'b1101)
        nextState = S1;
      else nextState = S0;
     end

  S1: begin
      
      if( Key2==1 & Password==4'b0111)
          nextState=S2;
       else if(Key2==1 && Password!=4'b0111)
           nextState=S0;
      else nextState=S1;
     end

  S2: begin
      
      if( Key1==1 && Password==4'b1001)
          nextState=S3;
       else if(Key1==1 && Password!=4'b1001)
           nextState=S0;
      else nextState=S2;
     end

S3:begin
            
           if( Key2==1 && Password==4'b0110)
               nextState=S4;
            else if(Key2==1 && Password!=4'b0110)
                nextState=S0;
           else nextState=S3;
          end
S4:begin
              
    nextState=S4;
    end
endcase

  always@(posedge Clk)
    if(Reset)
       state<=S0;
    else 
       state<=nextState;
assign Lock = (state==S4) ? 4'b1111:4'b0000;
endmodule