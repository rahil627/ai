import scala.io.Source

object MarkupRenderer {
  val markupTags = List(
    ("\\[title\\](.*?)\\[/title\\]", "\u001B[33;1m$1\u001B[0m"),    // Yellow bold text
    ("\\[emphasis\\](.*?)\\[/emphasis\\]", "\u001B[31;1m$1\u001B[0m") // Red bold text
  )

  def renderMarkup(text: String): String = {
    var result = text
    markupTags.foreach { case (tag, replacement) =>
      result = result.replaceAll(tag, replacement)
    }
    result
  }

  def main(args: Array[String]): Unit = {
    val inputFilename = "input.txt"
    val content = try {
      Source.fromFile(inputFilename).mkString
    } catch {
      case _: Throwable =>
        println(s"File '$inputFilename' not found.")
        return
    }

    val renderedContent = renderMarkup(content)
    println(renderedContent)
  }
}
