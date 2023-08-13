use std::fs;
use regex::Regex;

fn render_markup(text: &str) -> String {
    let markup_tags = [
        (r"\[title\](.*?)\[/title\]", "\x1B[33;1m$1\x1B[0m"),   // Yellow bold text
        (r"\[emphasis\](.*?)\[/emphasis\]", "\x1B[31;1m$1\x1B[0m"), // Red bold text
    ];

    let mut result = String::from(text);

    for (tag, replacement) in &markup_tags {
        let regex = Regex::new(tag).unwrap();
        result = regex.replace_all(&result, replacement).to_string();
    }

    result
}

fn main() {
    let input_filename = "input.txt";

    let content = match fs::read_to_string(input_filename) {
        Ok(content) => content,
        Err(_) => {
            eprintln!("File '{}' not found.", input_filename);
            return;
        }
    };

    let rendered_content = render_markup(&content);
    println!("{}", rendered_content);
}
