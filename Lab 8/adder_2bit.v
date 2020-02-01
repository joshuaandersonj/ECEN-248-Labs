`timescale 1ns / 1ps

module adder_2bit(Carry, Sum, A, B);

output wire [1:0] Sum;
output wire Carry;
input wire [1:0] A, B;
wire Carry0;
full_adder adder0(Sum[0], Carry0, A[0], B[0], 0);
full_adder adder1(Sum[1], Carry, A[1], B[1], Carry0);

endmodule