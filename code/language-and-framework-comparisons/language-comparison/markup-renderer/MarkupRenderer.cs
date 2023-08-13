using System;
using System.IO;
using System.Text.RegularExpressions;

namespace MarkupRendererApp {
    class Program {
        static string RenderMarkup(string text) {
            var markupTags = new[] {
                new { Tag = @"\[title\](.*?)\[/title\]", Replacement = "\u001b[33;1m$1\u001b[0m" }, // Yellow bold text
                new { Tag = @"\[emphasis\](.*?)\[/emphasis\]", Replacement = "\u001b[31;1m$1\u001b[0m" } // Red bold text
            };

            foreach (var tag in markupTags) {
                text = Regex.Replace(text, tag.Tag, tag.Replacement);
            }

            return text;
        }

        static void Main(string[] args) {
            var inputFilename = "input.txt";

            try {
                var content = File.ReadAllText(inputFilename);
                var renderedContent = RenderMarkup(content);
                Console.WriteLine(renderedContent);
            }
            catch (FileNotFoundException) {
                Console.WriteLine($"File '{inputFilename}' not found.");
            }
        }
    }
}
