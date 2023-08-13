defmodule MarkupRenderer do
  @markup_tags %{
    ~r/\[title\](.*?)\[\/title\]/ => fn content -> "\e[33;1m#{content}\e[0m" end,
    ~r/\[emphasis\](.*?)\[\/emphasis\]/ => fn content -> "\e[31;1m#{content}\e[0m" end
  }

  def render_markup(text) do
    Enum.reduce(@markup_tags, text, fn {tag, func}, acc ->
      Regex.replace(tag, acc, func, global: true)
    end)
  end

  def main do
    input_filename = "input.txt"

    case File.read(input_filename) do
      {:ok, content} ->
        rendered_content = render_markup(content)
        IO.puts(rendered_content)
      {:error, reason} ->
        IO.puts("File '#{input_filename}' not found.")
    end
  end
end

MarkupRenderer.main()
