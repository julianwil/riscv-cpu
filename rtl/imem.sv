module imem(
    input  logic [31:0] addr,
    output logic [31:0] instr
);

    logic [31:0] imem [0:31];

    assign instr = imem[addr[31:2]];

endmodule

