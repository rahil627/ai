function render_markup(text)
    markup_tags = [
        r"\[title\](.*?)\[/title\]" => "\x1B[33;1m\$1\x1B[0m",   # Yellow bold text
        r"\[emphasis\](.*?)\[/emphasis\]" => "\x1B[31;1m\$1\x1B[0m" # Red bold text
    ]

    result = text
    for (tag, replacement) in markup_tags
        result = replace(result, Regex(tag) => replacement)
    end
    return result
end

function main()
    input_filename = "input.txt"
    try
        content = read(input_filename, String)
        rendered_content = render_markup(content)
        println(rendered_content)
    catch
        println("File '$input_filename' not found.")
    end
end

main()
