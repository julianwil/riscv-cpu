module control_unit(
    input  logic [31:0] instr,

    output logic [3:0] alu_op,
    output logic alu_src,
    output logic reg_write,
    output logic mem_write,
    output logic mem_read
);

    logic [6:0] op;
    logic [2:0] funct3;
    logic [6:0] funct7;

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
                reg_write = 1;

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
                    3'b001: alu_op = 4'b0101; // <<

                    3'b101: begin
                        if (funct7 == 7'b0000000)
                            alu_op = 4'b0110; // >>
                        else
                            alu_op = 4'b0111; // >>>
                    end

                    3'b010: alu_op = 4'b1000;
                    3'b011: alu_op = 4'b1001;
                endcase
            end

            // I-type arithmetic
            7'b0010011: begin
                reg_write = 1;
                alu_src = 1;

                case (funct3)
                    3'b000: alu_op = 4'b0000;  // add immediate
                    3'b111: alu_op = 4'b0010; // and immediate
                    3'b110: alu_op = 4'b0011; // or immediate
                    3'b100: alu_op = 4'b0100; // xor immediate
                endcase
            end
        endcase
    end

endmodule
