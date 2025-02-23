module LogicGates (
    input wire A,
    input wire B,
    output wire [5:0] F
);

assign F[0] = A & B;    // AND
assign F[1] = A | B;    // OR
assign F[2] = ~(A & B); // NAND
assign F[3] = ~(A | B); // NOR
assign F[4] = A ^ B;    // XOR
assign F[5] = A ~^ B;   // XNOR

endmodule

