import System.Environment
import Data.Char

replacePunctuation :: String -> String -> Char -> IO ()
replacePunctuation inFile outFile replaceChar = do
    input <- readFile inFile
    let output = map (\c -> if isPunctuation c then replaceChar else c) input
    writeFile outFile output

main :: IO ()
main = do
    [inFileName, outputFileName, replaceChar] <- getArgs
    replacePunctuation inFileName outputFileName (head replaceChar)
    putStrLn "Введите: :main <входящий файл> <выходящий файл> <символ, на который заменяем>"
