package main

import (
	"fmt"
	"io/ioutil"
	"regexp"
	"strings"
)

var markupTags = map[*regexp.Regexp]string{
	regexp.MustCompile(`\[title\](.*?)\[/title\]`):       "\033[33;1m$1\033[0m", // Yellow bold text
	regexp.MustCompile(`\[emphasis\](.*?)\[/emphasis\]`): "\033[31;1m$1\033[0m", // Red bold text
}

func renderMarkup(text string) string {
	for tag, replacement := range markupTags {
		text = tag.ReplaceAllString(text, replacement)
	}
	return text
}

func main() {
	inputFilename := "input.txt"

	content, err := ioutil.ReadFile(inputFilename)
	if err != nil {
		fmt.Printf("File '%s' not found.\n", inputFilename)
		return
	}

	renderedContent := renderMarkup(string(content))
	fmt.Println(renderedContent)
}
