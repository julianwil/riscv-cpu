module data_mem(
    input logic clk,
    input logic write,
    input logic [7:0] addr,
    input logic [31:0] write_data,

    output logic [31:0] read_data
);

    logic [31:0] dmem [0:255];

    always_ff @(posedge clk) begin
        if (write)
            dmem[addr] <= write_data;
    end

    always_comb begin
        read_data = dmem[addr];
    end
    
endmodule

