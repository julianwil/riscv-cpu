module pc(
    input  logic clk,
    input  logic reset,
    input  logic [31:0] next,
    output logic [31:0] pc
);

    always_ff @(posedge clk) begin
        if (reset)
            pc <= 32'b0;
        else
            pc <= next;
    end

endmodule

