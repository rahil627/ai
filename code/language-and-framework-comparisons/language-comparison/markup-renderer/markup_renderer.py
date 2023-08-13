import re

# Define your custom markup tags and their corresponding replacements
MARKUP_TAGS = {
    r"<title>(.*?)<\/title>": r"\033[1;33m\1\033[0m",   # Yellow bold text
    r"<emphasis>(.*?)<\/emphasis>": r"\033[1;31m\1\033[0m"  # Red bold text
}

def render_markup(text):
    for tag, replacement in MARKUP_TAGS.items():
        text = re.sub(tag, replacement, text)
    return text

def main():
    input_filename = "input.txt"
    
    try:
        with open(input_filename, "r") as file:
            content = file.read()
            rendered_content = render_markup(content)
            print(rendered_content)
    except FileNotFoundError:
        print(f"File '{input_filename}' not found.")

if __name__ == "__main__":
    main()
