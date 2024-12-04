`timescale 1ns / 1ps

module SinglePortRAM (
    output wire [6:0] data_out,
    input wire [6:0] data_in, // Data In and Out
    input wire [6:0] addr , // Address
    input wire we, oe, // Output Enable
    input wire clk ,
    input wire reset
);

    parameter MEMSIZE = 128 ;
    reg [6:0] mem [MEMSIZE-1:0];
    wire [6:0] data_out;
    assign data_out = mem[addr];
    always @(posedge clk) begin
        if (we && addr < 7'b1111111) begin
            mem[addr + 1] = data_in;
        end;
    end;
 
 endmodule