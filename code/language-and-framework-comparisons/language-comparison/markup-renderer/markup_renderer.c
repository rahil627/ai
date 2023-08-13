#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

#define MAX_MATCHES 1
#define MAX_BUFFER 1024

typedef struct {
    const char *tag;
    const char *replacement;
} MarkupTag;

MarkupTag markupTags[] = {
    {"\\[title\\](.*?)\\[/title\\]", "\033[33;1m\\1\033[0m"},       // Yellow bold text
    {"\\[emphasis\\](.*?)\\[/emphasis\\]", "\033[31;1m\\1\033[0m"}  // Red bold text
};

void renderMarkup(char *text) {
    for (size_t i = 0; i < sizeof(markupTags) / sizeof(markupTags[0]); i++) {
        regex_t regex;
        if (regcomp(&regex, markupTags[i].tag, REG_EXTENDED) == 0) {
            regmatch_t matches[MAX_MATCHES];
            if (regexec(&regex, text, MAX_MATCHES, matches, 0) == 0) {
                size_t start = matches[0].rm_so;
                size_t end = matches[0].rm_eo;
                size_t replacementLength = strlen(markupTags[i].replacement);
                size_t matchLength = end - start;

                if (replacementLength < matchLength) {
                    memmove(text + start + replacementLength, text + end, strlen(text + end) + 1);
                } else if (replacementLength > matchLength) {
                    memmove(text + start + replacementLength, text + start + matchLength, strlen(text + start + matchLength) + 1);
                }

                strncpy(text + start, markupTags[i].replacement, replacementLength);
            }
            regfree(&regex);
        }
    }
}

int main() {
    char inputFilename[] = "input.txt";
    FILE *file = fopen(inputFilename, "r");

    if (file) {
        char buffer[MAX_BUFFER];
        size_t bytesRead;

        while ((bytesRead = fread(buffer, 1, sizeof(buffer), file)) > 0) {
            renderMarkup(buffer);
            printf("%s", buffer);
        }

        fclose(file);
    } else {
        printf("File '%s' not found.\n", inputFilename);
    }

    return 0;
}
