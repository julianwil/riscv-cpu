module dmem(
    input logic clk,
    input logic read,
    input logic write,
    input logic [31:0] addr,
    input logic [31:0] write_data,

    output logic [31:0] read_data
);

    logic [31:0] dmem [0:31];

    assign read_data = read ? dmem[addr[31:2]] : 32'b0;

    always_ff @(posedge clk) begin
        if (write)
            dmem[addr] <= write_data;
    end

endmodule

