+++
title = "Pointer Stability for ArrayLists"
description = "Pointer Stability for ArrayListsAuthor: Robbie LymanPointer Stability Locks were added to std’s Hash Map containers in 2024. A pull request initially opened by Leo Emar-Kar in 2"
date = "2026-08-27T00:00:00Z"
url = "https://ziglang.org/devlog/2026/#2026-08-27"
author = ""
text = ""
lastupdated = "2026-09-01T19:33:16.183462464Z"
seen = false
+++

[Pointer Stability for ArrayLists](#2026-08-27)
==========

Author: Robbie Lyman

Pointer Stability Locks were [added to `std`’s Hash Map containers in 2024](https://github.com/ziglang/zig/pull/17719). A pull request initially opened by [Leo Emar-Kar](https://github.com/emar-kar) in 2025 now brings this technique for ensuring memory safety to `std.ArrayList`.

To make use of this in your code, add a call to `lockPointers()` when you first store a pointer to an element or a slice of elements backed by the `ArrayList`, and call `unlockPointers()` when those pointers are no longer needed.

Here’s a somewhat contrived example. Let’s suppose we are managing two `ArrayLists`, say one of which is holding in memory the contents of some input, while the other is storing chunks of interest; maybe each line. Here’s a version of this process which has a bug; see if you can spot it.

```
const std = @import("std");

const Context = struct {
    history: std.ArrayList(u8),
    lines: std.ArrayList([]const u8),

    fn parse(ctx: *Context, allocator: std.mem.Allocator, input: []const u8) !void {
        const slice = try ctx.history.addManyAsSlice(allocator, input.len);
        @memcpy(slice, input);
        var it = std.mem.tokenizeScalar(u8, slice, '\n');
        while (it.next()) |line| {
            try ctx.lines.append(allocator, line);
        }
    }
};

```

Did you spot the bug? The problem is that elements of `Context.lines.items` depend on the *location* of `Context.history.items`, but this location may *change* if `Context.history` needs to grow beyond its current capacity. Here’s a reproduction of the bug:

```
test "Context.parse" {
    const input = "I'm first!\n";
    const input_two =
        \\But this text
        \\is juuuuuuuuuuuuuuuuuuuuuuuuust long enough that it
        \\causes a problem!
        \\And the problem could be that we segfault!
        \\Which is no fun to run into.
    ;
    var ctx: Context = .{
        .history = .empty,
        .lines = .empty,
    };
    const gpa = std.testing.allocator;
    defer ctx.history.deinit(gpa);
    defer ctx.lines.deinit(gpa);
    try ctx.parse(gpa, input);
    try ctx.parse(gpa, input_two);
    try std.testing.expectEqualStrings("I'm first!", ctx.lines.items[0]);
}

```

If I run this code with `zig test`, I get the following output (plus a little more).

```
====== expected this output: =========
I'm first!␃

======== instead found this: =========
UUUUUUUUUU␃

======================================
First difference occurs on line 1:
expected:
I'm first!
^ ('\x49')
found:
UUUUUUUUUU
^ ('\x55')
1/1 blah.test.Context.parse...FAIL (TestExpectedEqual)

```

Not great, right? This does tell us that we *have* a bug, but depending on your comfort debugging memory issues (and your choice of allocator, which will change how the bug manifests!), you might be lost for quite a while before you spot the fix.

Since we’ve stored pointers after the first call to `parse` in our test, what happens if we make this change?

```
    try ctx.parse(gpa, input);
+   ctx.history.lockPointers();
+   defer ctx.history.unlockPointers();
    try ctx.parse(gpa, input_two);
    try std.testing.expectEqualStrings("I'm first!", ctx.lines.items[0]);

```

We get a panic with a stack trace that shows us where our assumption about pointer stability was violated!

```
thread 3023222 panic: reached unreachable code
/Users/robbie/bin/lib/std/debug.zig:442:14: 0x102d2506f in assert (test)
    if (!ok) unreachable; // assertion failure
             ^
/Users/robbie/bin/lib/std/debug.zig:1880:15: 0x102d31ef7 in assertUnlocked (test)
        assert(l.state == .unlocked);
              ^
/Users/robbie/bin/lib/std/array_list.zig:1348:50: 0x102e3ced7 in ensureTotalCapacityPrecise (test)
            self.pointer_stability.assertUnlocked();
                                                 ^
/Users/robbie/bin/lib/std/array_list.zig:1341:51: 0x102e3cdff in ensureTotalCapacity (test)
            return self.ensureTotalCapacityPrecise(gpa, growCapacity(new_capacity));
                                                  ^
/Users/robbie/bin/lib/std/array_list.zig:1237:41: 0x102e4e5c3 in resize (test)
            try self.ensureTotalCapacity(gpa, new_len);
                                        ^
/Users/robbie/bin/lib/std/array_list.zig:1461:28: 0x102e4e40f in addManyAsSlice (test)
            try self.resize(gpa, try addOrOom(self.items.len, n));
                           ^
/Users/robbie/src/advent-of-code/2024/blah.zig:8:51: 0x102e4dc1f in parse (test)
        const ptr = try ctx.history.addManyAsSlice(allocator, input.len);
                                                  ^
/Users/robbie/src/advent-of-code/2024/blah.zig:35:18: 0x102e4e167 in test.Context.parse (test)
    try ctx.parse(gpa, input_two);

```

Nice, that’s already a big help: now I can see that I should consider memory safety issues as a probable cause of my test failure in addition or instead of a logic issue. Obviously this example was somewhat contrived, but I do find myself reaching for `std.ArrayList` as this type of backing storage in real code, so I hope you can see real-world use cases for it yourself.

Before I close, I want to point out something subtle: unlike `HashMap` and its friends, `ArrayList` is *ordered,* which means that operations on the list may move elements around even without moving, resizing or freeing the backing memory of the list as a whole. For example, the pointer (well, slice) returned by `addManyAsSlice(gpa, n)` may not point to the final `n` elements of the list if you call `orderedRemove()` or `pop()`. For this reason, although `orderedRemove()` and `pop()` never allocate, they *will* trigger the same assertion above after a call to `lockPointers()`.