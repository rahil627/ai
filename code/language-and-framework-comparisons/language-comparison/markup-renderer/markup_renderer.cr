def render_markup(text : String) : String
  markup_tags = {
    ~r/\[title\](.*?)\[\/title\]/ => "\e[33;1m\\1\e[0m",
    ~r/\[emphasis\](.*?)\[\/emphasis\]/ => "\e[31;1m\\1\e[0m"
  }

  markup_tags.each do |tag, replacement|
    text = text.gsub(tag, replacement)
  end

  text
end

def main
  input_filename = "input.txt"

  begin
    content = File.read(input_filename)
    rendered_content = render_markup(content)
    puts rendered_content
  rescue ex : Errno
    puts "File '#{input_filename}' not found."
  end
end

main
