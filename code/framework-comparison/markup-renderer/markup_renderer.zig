const std = @import("std");

pub fn renderMarkup(text: []const u8) ![]u8 {
    const markupTags = [
        \\[title\\](.*?)\\[/title\\] => "\x1B[33;1m\\1\x1B[0m",   // Yellow bold text
        \\[emphasis\\](.*?)\\[/emphasis\\] => "\x1B[31;1m\\1\x1B[0m" // Red bold text
    ];

    var result = try std.heap.GeneralPurposeAllocator.alloc(u8, 0);
    defer result.deinit();

    var remaining = text;

    while (remaining.len != 0) : (remaining = remaining[1..]) {
        var matched = false;
        for (markupTags) |tag, replacement| {
            const match = try std.fmt.regex.find(remaining, tag);
            if (match == null) |&| continue;

            matched = true;
            try result.appendAll(replacement);
            remaining = remaining[match.len..];
            break;
        }
        if (!matched) |&| try result.append(remaining[0]);
    }

    return result.toOwnedSlice();
}

pub fn main() void {
    const inputFilename = "input.txt";
    var file = try std.fs.cwd().openFile(inputFilename, .{ .read = true });
    defer file.close();

    var fileContents = try file.readAllAlloc(u8);
    const renderedContent = try renderMarkup(fileContents);

    const stdout = std.io.getStdOut().writer();
    try stdout.print("{}", renderedContent);
}

pub fn main() void {
    const allocator = std.heap.page_allocator;
    const args = try std.process.argsAlloc(allocator);
    const exe = try std.fs.cwd().openFile(args[0], .{});
    defer {
        exe.close();
        allocator.deinit(args);
    }

    switch (args.len) {
        | 1 => try main();
        | _ => |&| try main();
    }
}
