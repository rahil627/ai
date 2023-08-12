# Define your custom markup tags and their corresponding formatting codes
MARKUP_TAGS = {
  /<title>(.*?)<\/title>/ => "\e[33;1m\\1\e[0m",     # Yellow bold text
  /<emphasis>(.*?)<\/emphasis>/ => "\e[31;1m\\1\e[0m"  # Red bold text
}

def render_markup(text)
  MARKUP_TAGS.each do |tag, replacement|
    text.gsub!(tag, replacement)
  end
  text
end

def main
  input_filename = "input.txt"
  
  begin
    content = File.read(input_filename)
    rendered_content = render_markup(content)
    puts rendered_content
  rescue Errno::ENOENT
    puts "File '#{input_filename}' not found."
  end
end

if __FILE__ == $0
  main
end
