module tb;

    logic clk;
    logic reset;

    cpu dut(
        .clk(clk),
        .reset(reset)
    );

    always #10 clk = ~clk; 

    initial begin
        clk = 0;
        reset = 1;
        
        dut.im0.imem[0] = 32'h02A00293;

        #20;
        reset = 0;

        $display(
            "PC=%h INSTR=%h x5=%h",
            dut.pc_val,
            dut.im0.instr,
            dut.rf0.registers[5]
        );

        repeat (10) begin
            @(posedge clk);
            #1;
            $display(
                "PC=%h INSTR=%h x5=%h",
                dut.pc_val,
                dut.im0.instr,
                dut.rf0.registers[5]
            );
        end

        $finish;
    end

endmodule
