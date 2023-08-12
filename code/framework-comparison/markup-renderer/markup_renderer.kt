import java.io.File

fun renderMarkup(text: String): String {
    val markupTags = listOf(
        """\[title\](.*?)\[/title\]""" to "\u001B[33;1m$1\u001B[0m",     // Yellow bold text
        """\[emphasis\](.*?)\[/emphasis\]""" to "\u001B[31;1m$1\u001B[0m"  // Red bold text
    )

    var result = text
    for ((tag, replacement) in markupTags) {
        result = result.replace(Regex(tag), replacement)
    }
    return result
}

fun main() {
    val inputFilename = "input.txt"
    val content = try {
        File(inputFilename).readText()
    } catch (e: Exception) {
        println("File '$inputFilename' not found.")
        return
    }

    val renderedContent = renderMarkup(content)
    println(renderedContent)
}
