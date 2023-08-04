const std = @import("std");
const expect = std.testing.expect;

test "allocation" {
    const allocator = std.heap.page_allocator;

    const memory = try allocator.alloc(u8, 100);
    _ = memory;
    defer allocator.free(memory);

    try expect(memory.len == 100);

    try expect(@TypeOf(memory) == []u8);
}

test "fixed buffer allocation" {
    var buffer: [1000]u8 = undefined;
    _ = buffer;
    var fba = std.heap.FixedBufferAllocator.init(&buffer);
    _ = fba;
    const allocator = fba.allocator();
    _ = allocator;
    const memory = try allocator.alloc(u8, 100);
    _ = memory;
    defer allocator.free(memory);

    try expect(memory.len == 100);

    try expect(@TypeOf(memory) == []u8);
}

test "area allocator" {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    _ = arena;
    defer arena.deinit();

    const allocator = arena.allocator();
    _ = allocator;

    _ = try allocator.alloc(u8, 1);
    _ = try allocator.alloc(u32, 100);
}

test "allocator create/destroy" {
    const byte = try std.heap.page_allocator.create(u8);
    defer std.heap.page_allocator.destroy(byte);
    byte.* = 255;
}

// test "GPA" {
//     var gpa = std.heap.GeneralPurposeAllocator(.{}){};
//     var allocator = gpa.allocator();

//     defer {
//         const deinit_status = gpa.deinit();
//         _ = deinit_status;
//         if (deinit_status == .leak) {
//             expect(false) catch @panic("test fail");
//         }
//     }
//     const bytes = allocator.alloc(u8, 100);
//     defer allocator.free(bytes);
// }
