module system(
    output wire RsTx, // UART Transmit
    input wire RsRx, // UART Receive
    input clk,
    output wire Hsync, Vsync, // VGA Sync
    output wire [3:0] vgaRed, vgaGreen, vgaBlue, // VGA Colors
    output [6:0] seg,
    output dp,
    output [3:0] an
    );

assign an=4'b1110;
uart uart(clk,RsRx,RsTx, seg);
vga vga(
    .clk(clk), .sw(sw),
    .push({btnL, btnU}),
    .hsync(Hsync), .vsync(Vsync),
    .rgb({vgaRed, vgaGreen, vgaBlue})
    );
endmodule

