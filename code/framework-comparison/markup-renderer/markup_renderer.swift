import Foundation

func renderMarkup(text: String) -> String {
    let markupTags = [
        ("\\[title\\](.*?)\\[/title\\]", "\u{001B}[33;1m$1\u{001B}[0m"),   // Yellow bold text
        ("\\[emphasis\\](.*?)\\[/emphasis\\]", "\u{001B}[31;1m$1\u{001B}[0m") // Red bold text
    ]
    
    var result = text
    for (tag, replacement) in markupTags {
        if let regex = try? NSRegularExpression(pattern: tag) {
            let range = NSRange(location: 0, length: result.utf16.count)
            result = regex.stringByReplacingMatches(in: result, options: [], range: range, withTemplate: replacement)
        }
    }
    return result
}

let inputFilename = "input.txt"
do {
    let content = try String(contentsOfFile: inputFilename)
    let renderedContent = renderMarkup(text: content)
    print(renderedContent)
} catch {
    print("File '\(inputFilename)' not found.")
}
