module alu(
    input  logic [31:0] a,
    input  logic [31:0] b,
    input  logic [3:0] op,
    output logic [31:0] out
);

    always_comb begin
        case (op)
            4'b0000: out = a + b;
            4'b0001: out = a - b;
            4'b0010: out = a & b;
            4'b0011: out = a | b;
            4'b0100: out = a ^ b;
            default: out = 32'b0;
        endcase
    end

endmodule

