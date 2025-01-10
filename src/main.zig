const raylib = @import("raylib");

pub fn main() void {
    raylib.setConfigFlags(raylib.ConfigFlags{ .window_resizable = true });
    raylib.initWindow(800, 800, "hello world!");
    raylib.setTargetFPS(60);

    defer raylib.closeWindow();

    while (!raylib.windowShouldClose()) {
        raylib.beginDrawing();
        defer raylib.endDrawing();

        raylib.clearBackground(raylib.getColor(0xFFFFFF));
        raylib.drawFPS(10, 10);

        raylib.drawText("hello world!", 100, 100, 20, raylib.getColor(0xFFFFFF));
    }
}
