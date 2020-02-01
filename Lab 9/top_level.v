`timescale 1ns / 1ps
`default_nettype none

// This top level module wires all of our synchronous components together

module top_level(LEDs, SWs, BTNs, FastClk);
  output wire [3:0] LEDs; // four-bit wide output
  input wire FastClk; //one-bit wire
  input wire [1:0] SWs, BTNs; // two-bit wide input
  wire [3:0] Clocks; // four-bit intermediate wire
  wire [2:0] Count; // four-bit intermediate wire
  wire Carry2; // one-bit wire
  reg SlowClk; //one-bit register
  
  // This behavioral code runs constantly
  always@(*)
    case(SWs) // the behavior depends on the input of SWs
	   2'b00:SlowClk=Clocks[0];
		2'b01:SlowClk=Clocks[1];
		2'b10:SlowClk=Clocks[2];
		2'b11:SlowClk=Clocks[3];
	 endcase
	
 // have the up_counter do it's work
 up_counter counter(Count, Carry2, BTNs[0], SlowClk, BTNs[1]);
 
 // send the output to the LEDs to display visually
 assign LEDs[0]=Count[0];
 assign LEDs[1]=Count[1];
 assign LEDs[2]=Count[2];
 assign LEDs[3]=Carry2;
 
 // divide the clock signal
 clock_divider clk_div0(
    .ClkOut(Clocks),
	 .ClkIn(FastClk)
	);
	
endmodule