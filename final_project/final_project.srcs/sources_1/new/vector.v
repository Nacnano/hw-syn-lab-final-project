`timescale 1ns / 1ps

module vector(
    input clk,
    input wire [6:0] data_in,
    input we,
    input reset,
    input wire [6:0] idx,
    output reg [6:0] data_out
    );
    
    parameter MEMSIZE = 128;
    reg [6:0] mem [MEMSIZE - 1:0];
    reg [6:0] itr1, itr2;
    
    generate
        genvar i;
        for (i = 0; i < MEMSIZE; i = i + 1) begin : memory_reset
            always @(posedge clk) begin
                if (reset) begin
                    mem[i] <= 7'b0;
                end
            end
        end
    endgenerate
    always @(posedge clk) begin
        // Read operation
        data_out = mem[idx];
        
        if (we) begin
            // Write operation
            mem[itr1] = data_in;
            itr1 = (itr1 + 1) % MEMSIZE;
        end
    end
endmodule