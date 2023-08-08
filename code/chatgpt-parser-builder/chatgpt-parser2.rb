# write a script in Ruby that will parse a chatgpt prompt and create files from the code snippets, inferring the name of the files from the class name, provided by chatgpt

require 'openai'

# Set your OpenAI API key here
OpenAI.configure do |config|
  config.access_token = 'poop' # DO NOT MAKE PUBLIC
end

client = OpenAI::Client.new

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
re-create a prototype version of the bumper balls mini game from the Mario Party series using the Heaps.io game engine
PROMPT

# Call the OpenAI API
response = client.completions(
  parameters: {
  engine: 'text-davinci-003',
  prompt: chat_prompt,
  max_tokens: 150,  # Adjust as needed
  stop: nil
})

# Parse and extract code snippets from the response
snippets = response['choices'][0]['text'].split(/(\d+\.\s+class )/).reject(&:empty?).each_slice(2).map do |class_name, code| # lmao, beautiful!
  [class_name.strip, code.strip]
end

# Create files from code snippets
create_files(snippets)


=begin
# Parse the response and extract code snippets
code_snippets = response.choices[0].text.scan(/```(.*?)```/m).flatten

# Create files from code snippets
code_snippets.each_with_index do |code, index|
  filename = "code_snippet_#{index + 1}.py"
  File.open(filename, 'w') { |file| file.write(code) }
  puts "File '#{filename}' created."
end
=end