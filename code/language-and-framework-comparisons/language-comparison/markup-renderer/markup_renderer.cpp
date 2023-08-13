#include <iostream>
#include <fstream>
#include <string>
#include <regex>

class MarkupRenderer {
public:
    MarkupRenderer() {
        markupTags = {
            {std::regex("\\[title\\](.*?)\\[/title\\]"), "\033[33;1m$1\033[0m"},     // Yellow bold text
            {std::regex("\\[emphasis\\](.*?)\\[/emphasis\\]"), "\033[31;1m$1\033[0m"} // Red bold text
        };
    }

    std::string renderMarkup(const std::string &text) {
        std::string result = text;
        for (const auto &tag : markupTags) {
            result = std::regex_replace(result, tag.first, tag.second);
        }
        return result;
    }

    void processFile(const std::string &filename) {
        std::ifstream file(filename);
        if (file.is_open()) {
            std::string line;
            while (getline(file, line)) {
                std::cout << renderMarkup(line) << std::endl;
            }
            file.close();
        } else {
            std::cout << "File '" << filename << "' not found." << std::endl;
        }
    }

private:
    std::vector<std::pair<std::regex, std::string>> markupTags;
};

int main() {
    MarkupRenderer renderer;
    std::string inputFilename = "input.txt";
    renderer.processFile(inputFilename);
    return 0;
}
