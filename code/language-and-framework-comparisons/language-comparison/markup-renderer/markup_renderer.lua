-- Define your custom markup tags and their corresponding ANSI escape codes
local markupTags = {
    { "%[title%](.-)%[/title%]", "\27[33;1m%1\27[0m" },     -- Yellow bold text
    { "%[emphasis%](.-)%[/emphasis%]", "\27[31;1m%1\27[0m" } -- Red bold text
  }
  
  -- Function to render markup
  function renderMarkup(text)
    for _, tag in ipairs(markupTags) do
      text = string.gsub(text, tag[1], tag[2])
    end
    return text
  end
  
  -- Main function
  function main()
    local inputFilename = "input.txt"
    local file = io.open(inputFilename, "r")
  
    if file then
      local content = file:read("*all")
      file:close()
      local renderedContent = renderMarkup(content)
      print(renderedContent)
    else
      print("File '" .. inputFilename .. "' not found.")
    end
  end
  
  -- Run the main function
  main()
  