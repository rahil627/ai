// write a script that will automatically create files from the code snippets provided by chatgpt

import openai
import os

# Set your OpenAI API key here
openai.api_key = 'YOUR_OPENAI_API_KEY'

# Function to create files from code snippets
def create_files(snippets):
    for i, snippet in enumerate(snippets):
        filename = f"code_{i + 1}.txt"
        with open(filename, 'w') as file:
            file.write(snippet)
        print(f"Created file: {filename}")

# ChatGPT prompt
chat_prompt = "Create code files from the following snippets:\n1. def say_hello\n  puts 'Hello, world!'\n2. class MyClass\n  attr_accessor :name\n\n  def initialize(name)\n    @name = name\n  end\n"

# Call the ChatGPT API
response = openai.Completion.create(
    engine="text-davinci-003",
    prompt=chat_prompt,
    max_tokens=150,  # Adjust as needed
    stop=None
)

# Extract code snippets from ChatGPT's response
code_snippets = [choice['text'].strip() for choice in response.choices]

# Create files from code snippets
create_files(code_snippets)
