module cpu(
    input clk,
    input reset
);

    logic [31:0] data_rs1;
    logic [31:0] data_rs2;
    logic [31:0] alu_data;
    logic [31:0] dm_data;

    logic [31:0] pc_val;

    logic [31:0] instr;
    logic [3:0] alu_op;
    logic alu_src;
    logic reg_write;
    logic mem_write;
    logic mem_read;

    logic [31:0] write_data;

    logic [31:0] alu_b;

    logic [11:0] imm;

    assign imm = instr[31:20];
    assign write_data = mem_read ? dm_data : alu_data;
    assign alu_b = alu_src ? imm : data_rs2;

    // register file
    register_file rf0(
        .clk(clk),
        .reg_write(reg_write),
        .data(write_data),
        .rs1(instr[19:15]),
        .rs2(instr[24:20]),
        .rd(instr[11:7]),
        .data_rs1(data_rs1),
        .data_rs2(data_rs2)
    );

    // data memory
    data_mem dm0(
        .clk(clk),
        .write(mem_write),
        .addr(alu_data[7:0]),
        .write_data(data_rs2),
        .read_data(dm_data)
    );

    // instruction memory
    instr_mem im0(
        .addr(pc_val),
        .instr(instr)
    );

    // program counter
    pc pc0(
       .clk(clk),
       .reset(reset),
       .next(pc_val + 4),
       .pc(pc_val)
    );

    // control unit
    control_unit cu0(
        .instr(instr),
        .alu_op(alu_op),
        .alu_src(alu_src),
        .reg_write(reg_write),
        .mem_write(mem_write),
        .mem_read(mem_read)
    );

    // arithmetic logic unit
    alu alu0(
        .a(data_rs1),
        .b(alu_b),
        .op(alu_op),
        .out(alu_data)
    );

endmodule

