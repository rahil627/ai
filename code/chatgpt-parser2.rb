# write a script in Ruby that will parse a chatgpt prompt and create files from the code snippets, inferring the name of the files from the class name, provided by chatgpt

require 'openai'

# Set your OpenAI API key here
Openai.configure do |config|
  config.api_key = 'YOUR_OPENAI_API_KEY'
end

# Function to create files from code snippets
def create_files(snippets)
  snippets.each do |class_name, code|
    filename = "#{class_name.downcase}.rb"
    
    File.open(filename, 'w') do |file|
      file.write(code)
    end
    
    puts "Created file: #{filename}"
  end
end

# ChatGPT prompt
chat_prompt = <<~PROMPT
  Create code files from the following snippets:
  1. class HelloWorld
       def initialize
           @message = 'Hello, world!'
       end

       def say_hello
           puts @message
       end
  2. class Calculator
       def add(a, b)
           a + b
       end
PROMPT

# Call the OpenAI API
response = Openai::Completion.create(
  engine: 'text-davinci-003',
  prompt: chat_prompt,
  max_tokens: 150,  # Adjust as needed
  stop: nil
)

# Parse and extract code snippets from the response
snippets = response['choices'][0]['text'].split(/(\d+\.\s+class )/).reject(&:empty?).each_slice(2).map do |class_name, code| # lmao, beautiful!
  [class_name.strip, code.strip]
end

# Create files from code snippets
create_files(snippets)
