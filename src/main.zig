const std = @import("std");
const os = std.os;
const warn = std.debug.warn;
const raylib = @import("raylib");

const ScreenWidth = 256;
const ScreenHeight = 240;

pub fn main() !void {
    raylib.setConfigFlags(raylib.ConfigFlags{ .window_resizable = false });
    raylib.initWindow(ScreenWidth * 2, ScreenHeight * 2, "Game Of Life");
    raylib.setTargetFPS(60);

    defer raylib.closeWindow();

    var current_canvas: [ScreenHeight][ScreenWidth]bool = undefined;
    var next_canvas: [ScreenHeight][ScreenWidth]bool = undefined;
    try initRandom(&current_canvas);
    std.debug.print("Started", .{});

    while (!raylib.windowShouldClose()) {
        raylib.beginDrawing();
        defer raylib.endDrawing();

        raylib.clearBackground(raylib.Color.black);

        for (current_canvas, 0..) |row, y| {
            for (row, 0..) |_, x| {
                next_canvas[y][x] = nextStep(current_canvas, x, y);
                if (next_canvas[y][x]) {
                    raylib.drawRectangle(@intCast(x * 2), @intCast(y * 2), 2, 2, raylib.Color.blue);
                }
            }
        }

        for (current_canvas, 0..) |_, i| {
            for (current_canvas, 0..) |_, j| {
                current_canvas[i][j] = next_canvas[i][j];
            }
        }

        std.time.sleep(100000000);
    }
}

pub fn initRandom(canvas: *[ScreenHeight][ScreenWidth]bool) !void {
    var prng = std.rand.DefaultPrng.init(blk: {
        var seed: u64 = undefined;
        try std.posix.getrandom(std.mem.asBytes(&seed));
        break :blk seed;
    });
    for (0..ScreenHeight) |y| {
        for (0..ScreenWidth) |x| {
            canvas[y][x] = prng.random().boolean();
        }
    }
}

pub fn nextStep(canvas: [ScreenHeight][ScreenWidth]bool, x: usize, y: usize) bool {
    var neighbors: u8 = 0;

    //vertical neighbors
    if (y > 0 and canvas[y - 1][x]) neighbors += 1;
    if (y < ScreenHeight - 1 and canvas[y + 1][x]) neighbors += 1;

    //Horizontal neighbors
    if (x > 0 and canvas[y][x - 1]) neighbors += 1;
    if (x < ScreenWidth - 1 and canvas[y][x + 1]) neighbors += 1;

    //Diaglonal neighbors
    if (y > 0 and x > 0 and canvas[y - 1][x - 1]) neighbors += 1;
    if (y > 0 and x < ScreenWidth - 1 and canvas[y - 1][x + 1]) neighbors += 1;
    if (x > 0 and y < ScreenHeight - 1 and canvas[y + 1][x - 1]) neighbors += 1;
    if (y < ScreenHeight - 1 and x < ScreenWidth - 1 and canvas[y + 1][x + 1]) neighbors += 1;

    switch (neighbors) {
        2 => return canvas[y][x],
        3 => return true,
        else => return false,
    }
}
