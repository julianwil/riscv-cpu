module register_file(
    input  logic clk,
    input  logic reg_write,
    input  logic [31:0] data,
    input  logic [4:0] rs1,
    input  logic [4:0] rs2,
    input  logic [4:0] rd,

    output logic [31:0] data_rs1,
    output logic [31:0] data_rs2
);

    logic [31:0] registers [0:31];

    assign data_rs1 = (rs1 == 0) ? 32'b0 : registers[rs1];
    assign data_rs2 = (rs2 == 0) ? 32'b0 : registers[rs2];

    always_ff @(posedge clk) begin
        if (reg_write && rd != 0) begin
            registers[rd] <= data;
        end
    end

endmodule

