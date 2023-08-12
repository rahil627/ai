import 'dart:io';
import 'package:ansi_styles/ansi_styles.dart';

String renderMarkup(String text) {
  final markupTags = [
    {'\\[title\\](.*?)\\[/title\\]': AnsiStyles.yellow.bold.apply('$1')}, // Yellow bold text
    {'\\[emphasis\\](.*?)\\[/emphasis\\]': AnsiStyles.red.bold.apply('$1')}, // Red bold text
  ];

  String result = text;
  for (final tag in markupTags) {
    final regex = RegExp(tag.keys.first, multiLine: true);
    final replacement = tag.values.first;
    result = result.replaceAllMapped(regex, (match) => replacement);
  }
  return result;
}

void main() {
  final inputFilename = 'input.txt';
  try {
    final content = File(inputFilename).readAsStringSync();
    final renderedContent = renderMarkup(content);
    print(renderedContent);
  } catch (e) {
    print("File '$inputFilename' not found.");
  }
}
