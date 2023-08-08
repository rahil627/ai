// write a script in Ruby that will automatically create files from the code provided by chatgpt
# Function to create files from code snippets
def create_files(snippets)
    snippets.each_with_index do |snippet, index|
      filename = "code_#{index + 1}.txt"
      
      File.open(filename, "w") do |file|
        file.write(snippet)
      end
      
      puts "Created file: #{filename}"
    end
  end
  
  # Replace this array with the code snippets you receive from ChatGPT
  code_snippets = [
    "def say_hello\n  puts 'Hello, world!'\nend",
    "class MyClass\n  attr_accessor :name\n\n  def initialize(name)\n    @name = name\n  end\nend"
  ]
  
  # Call the function to create files
  create_files(code_snippets)
  