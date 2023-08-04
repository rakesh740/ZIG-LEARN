const expect = @import("std").testing.expect;

const Direction = enum { north, south, east, west };

const value = enum(u2) { zero, one, two };

test "enum ordinal value" {
    try expect(@enumToInt(value.zero) == 0);
    try expect(@enumToInt(value.one) == 1);
    try expect(@enumToInt(value.two) == 2);
}

const value2 = enum(u32) { hundred = 100, thousand = 1000, next };

test "set enum ordinal value" {
    try expect(@enumToInt(value2.hundred) == 100);
    try expect(@enumToInt(value2.thousand) == 1000);
    try expect(@enumToInt(value2.next) == 1001);
}

const suit = enum {
    club,
    spades,
    diamonds,
    hearts,
    pub fn isClubs(self: suit) bool {
        return self == suit.club;
    }
};

test "enum method" {
    try expect(suit.spades.isClubs() == suit.isClubs(.spades));
}

const Node = enum {
    var count: u32 = 0;
    on,
    off,
};

test "hmm  " {
    Node.count += 1;
    try expect(Node.count == 1);
}
