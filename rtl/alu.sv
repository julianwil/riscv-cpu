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
            4'b0101: out = a << b;
            4'b0110: out = a >> b;
            4'b0111: out = $signed(a) >>> b;
            4'b1000: begin
                if (a < b) 
                    out = 32'b1;
                else 
                    out = 32'b0;
            end
            4'b1001: begin
                if ($signed(a) < $signed(b)) 
                    out = 32'b1;
                else 
                    out = 32'b0;
            end
            default: out = 32'b0;
        endcase
    end

endmodule

