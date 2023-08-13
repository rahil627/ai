const fs = require('fs');

const markupTags = [
    { tag: /\[title\](.*?)\[\/title\]/g, replacement: '\x1b[33;1m$1\x1b[0m' },    // Yellow bold text
    { tag: /\[emphasis\](.*?)\[\/emphasis\]/g, replacement: '\x1b[31;1m$1\x1b[0m' } // Red bold text
];

function renderMarkup(text) {
    for (const tag of markupTags) {
        text = text.replace(tag.tag, tag.replacement);
    }
    return text;
}

const inputFilename = 'input.txt';

fs.readFile(inputFilename, 'utf8', (err, content) => {
    if (err) {
        console.log(`File '${inputFilename}' not found.`);
        return;
    }
    
    const renderedContent = renderMarkup(content);
    console.log(renderedContent);
});
