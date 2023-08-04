const std = @import("std");

pub fn main() void {
    std.debug.print("Hello, {s}!\n", .{"World"});

    const a: i64 = 2;
    var b: []const u8 = "hello";

    const inferred_const = @as(i32, 20);

    var inferred_var = @as([]const u8, "world");

    const undefinedConst = undefined;

    std.debug.print("variable a is {} \n", .{a});

    // Arrays

    var anArray = [3]i8{ 1, 2, 3 };

    var anArrayLen = anArray.len;

    // If else condition statements

}
