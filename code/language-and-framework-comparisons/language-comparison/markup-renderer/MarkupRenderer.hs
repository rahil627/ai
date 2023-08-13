import Text.Regex.PCRE
import System.IO

markupTags :: [(String, String -> String)]
markupTags =
    [ ("\\[title\\](.*?)\\[/title\\]", yellowBold)
    , ("\\[emphasis\\](.*?)\\[/emphasis\\]", redBold)
    ]

yellowBold :: String -> String
yellowBold content = "\x1B[33;1m" ++ content ++ "\x1B[0m"

redBold :: String -> String
redBold content = "\x1B[31;1m" ++ content ++ "\x1B[0m"

renderMarkup :: String -> String
renderMarkup text = foldl applyTag text markupTags
    where
        applyTag :: String -> (String, String -> String) -> String
        applyTag content (regex, tagFunction) = content =~ regex `sub` (tagFunction . (!! 1))

main :: IO ()
main = do
    let inputFilename = "input.txt"
    content <- readFile inputFilename
    let renderedContent = renderMarkup content
    putStrLn renderedContent
