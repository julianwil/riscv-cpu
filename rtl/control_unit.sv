module control_unit(
    input  logic [31:0] instr,

    output logic [3:0] alu_op,
    output logic alu_src,
    output logic reg_write,
    output logic mem_write,
    output logic mem_read
);

    logic [6:0] op;
    logic [14:12] funct3;
    logic [31:25] funct7;

    assign op = instr[6:0];
    assign funct3 = instr[14:12];
    assign funct7 = instr[31:25];

    always_comb begin
        // default values
        alu_op = 4'b0000;
        alu_src = 0;
        reg_write = 0;
        mem_write = 0;
        mem_read = 0;

        case (op)
            // R-type
            7'b0110011: begin
                case (funct3)
                    3'b000: begin
                        if (funct7 == 7'b0000000) 
                            alu_op = 4'b0000; // add
                        else 
                            alu_op = 4'b0001; // sub
                    end
    
                    3'b111: alu_op = 4'b0010; // and
                    3'b110: alu_op = 4'b0011; // or
                    3'b100: alu_op = 4'b0100; // xor
                endcase
            end
        endcase
    end

endmodule
