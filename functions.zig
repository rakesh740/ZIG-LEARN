//All function arguments are immutable - if a copy is desired the user must explicitly make one

const expect = @import("std").testing.expect;

fn addFive(x: u32) u32 {
    return x + 5;
}

test "function" {
    var x: u32 = 5;
    var y: u32 = addFive(x);
    try expect(y == 10);
    try expect(@TypeOf(y) == u32);
}

//  Recursion :

fn fibonacci(n: u32) u32 {
    if (n == 0 or n == 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
}

test "function recursion" {
    const x = fibonacci(10);

    try expect(x == 55);
}

// When recursion happens, the compiler is no longer able to work out the maximum stack size.
// This may result in unsafe behaviour - a stack overflow. Details on how to achieve safe recursion will be covered in future.

// defer
// Defer is used to execute a statement while exiting the current block.

test "defer" {
    var x: i16 = 5;
    {
        defer x += 2;
        try expect(x == 5);
    }
    try expect(x == 7);
}

test "multi defer" {
    var x: f32 = 5;
    {
        defer x += 2;
        defer x /= 2;
    }
    try expect(x == 4.5);
}
