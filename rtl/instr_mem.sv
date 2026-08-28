module instr_mem(
    input logic [7:0] addr,

    output logic [31:0] instr
);

    logic [31:0] imem [0:255];

    assign instr = imem[addr];

endmodule

