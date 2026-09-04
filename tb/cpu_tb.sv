module tb;

    logic clk;
    logic reset;

    task automatic dump_state();
        $display(                                                                                                                                                    
            "PC=%h INSTR=%h x1=%h x2=%h x3=%h",                                                                                                                            
            dut.pc_val,                                                                                                                                              
            dut.im0.instr,                                                                                                                                           
            dut.rf0.registers[1],                                                                                                                                    
            dut.rf0.registers[2],
            dut.rf0.registers[3]
        );                 
    endtask

    cpu dut(
        .clk(clk),
        .reset(reset)
    );

    always #10 clk = ~clk; 

    initial begin
        clk = 0;
        reset = 1;

        /*
         * program
         */

        // initialize x1 and x2
        dut.im0.imem[1]  = 32'b000000001010_00000_000_00001_0010011; // addi x1, x0, 10
        dut.im0.imem[2]  = 32'b000000000011_00000_000_00010_0010011; // addi x2, x0, 3

        // R-type
        dut.im0.imem[3]  = 32'b0000000_0010_00001_000_00011_0110011; // add x3, x1, x2
        dut.im0.imem[4]  = 32'b0100000_0010_00001_000_00011_0110011; // sub x3, x1, x2
        dut.im0.imem[5]  = 32'b0000000_0010_00001_111_00011_0110011; // and x3, x1, x2
        dut.im0.imem[6]  = 32'b0000000_0010_00001_110_00011_0110011; // or  x3, x1, x2
        dut.im0.imem[7]  = 32'b0000000_0010_00001_100_00011_0110011; // xor x3, x1, x2

        // I-type
        dut.im0.imem[8]  = 32'b000000000011_00001_111_00011_0010011; // andi x3, x1, 3
        dut.im0.imem[9]  = 32'b000000000011_00001_110_00011_0010011; // ori  x3, x1, 3
        dut.im0.imem[10] = 32'b000000000011_00001_100_00011_0010011; // xori x3, x1, 3

        #20;
        reset = 0;

        dump_state();
        
        repeat (10) begin
            @(posedge clk);
            #1;
            dump_state();
        end

        $finish;
    end

endmodule
