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
