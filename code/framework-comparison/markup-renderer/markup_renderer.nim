import strutils, re

proc renderMarkup(text: string): string =
  let markupTags = @[
    r"\[title\](.*?)\[/title\]" -> "\x1B[33;1m\\1\x1B[0m",    # Yellow bold text
    r"\[emphasis\](.*?)\[/emphasis\]" -> "\x1B[31;1m\\1\x1B[0m" # Red bold text
  ]

  var result = text
  for (tag, replacement) in markupTags:
    result = result.re.replace(tag, replacement)
  return result

proc main() =
  let inputFilename = "input.txt"
  try:
    let content = readFile(inputFilename)
    let renderedContent = renderMarkup(content)
    echo renderedContent
  except IOError:
    echo "File '", inputFilename, "' not found."

when isMainModule:
  main()
