module system(
    output wire RsTx, //uart
    input wire RsRx, //uart
    input clk, //both
    output wire Hsync, Vsync, //vga
    output wire [3:0] vgaRed, vgaGreen, vgaBlue, //vga
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

