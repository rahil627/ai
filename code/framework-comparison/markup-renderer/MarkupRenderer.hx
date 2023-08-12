class MarkupRenderer {
    public static function renderMarkup(text: String): String {
        var markupTags:Array<String> = [
            "\\[title\\](.*?)\\[/title\\]" => "\x1B[33;1m$1\x1B[0m",   // Yellow bold text
            "\\[emphasis\\](.*?)\\[/emphasis\\]" => "\x1B[31;1m$1\x1B[0m" // Red bold text
        ];

        var result:String = text;
        for (tag in markupTags) {
            result = result.replace(EReg.create(tag[0]), tag[1]);
        }
        return result;
    }

    public static function main(): Void {
        var inputFilename:String = "input.txt";
        try {
            var content:String = Sys.io().readFile(inputFilename);
            var renderedContent:String = renderMarkup(content);
            Sys.println(renderedContent);
        } catch (e:Dynamic) {
            Sys.println("File '$inputFilename' not found.");
        }
    }
}

MarkupRenderer.main();
