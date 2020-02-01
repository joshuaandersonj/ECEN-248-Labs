`timescale 1ns / 1ps
`default_nettype none

module combination_lock_fsm(

   /*for ease of debugging, output state*/
	output reg [1:0] state,
   output wire [3:0] Lock, // asserted when locked
   input wire Key1, Key2, //Unlock buttons 0 and 1 respectively
   input wire [3:0] Password, //indicate number
   input wire Clk, Reset //clock and reset
);
parameter  S0=3'b000,
           S1=3'b001,
           S2=3'b010,
           S3=3'b011;  
  reg [2:0] nextState;
 reg[3:0] isUnlocked;
  always@(*)
case(state)
  S0: begin
      isUnlocked=0;
      if(Key1 == 1 && Password == 4'b1101)
        nextState = S1;
      else nextState = S0;
     end

  S1: begin
      isUnlocked=0;
      if( Key2==1 & Password==4'b0111)
          nextState=S2;
       else if(Key2==1 && Password!=4'b0111)
           nextState=S0;
      else nextState=S1;
     end

  S2: begin
      isUnlocked=0;
      if( Key1==1 && Password==4'b1001)
          nextState=S3;
       else if(Key1==1 && Password!=4'b1001)
           nextState=S0;
      else nextState=S2;
     end

S3:begin
       isUnlocked=4'b1111;
		 nextState=S3;
   end
endcase

  always@(posedge Clk)
    if(Reset)
       state<=S0;
    else 
       state<=nextState;
assign Lock = isUnlocked;
endmodule