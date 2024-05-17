import Data.List (delete)
import System.Environment
import System.IO
import Text.Read (readMaybe)

convert :: String -> Maybe Int
convert str = readMaybe str :: Maybe Int

viewFile :: FilePath -> IO ()
viewFile path = do
  contents <- readFile path
  putStrLn contents

appendDataFile :: FilePath -> String -> IO ()
appendDataFile path newContent = do
  appendFile path (newContent ++ "\n")

removeLineFromFile :: FilePath -> Int -> IO ()
removeLineFromFile path lineNumber = do
  contents <- readFile path
  let lineList = lines contents
  let updatedContent = unlines $ delete (lineList !! (lineNumber - 1)) lineList
  writeFile path updatedContent

copyFileWithLengthFilter :: FilePath -> FilePath -> Int -> IO ()
copyFileWithLengthFilter sourcePath destPath filterLength = do
  contents <- readFile sourcePath
  let filteredContent = unlines $ filter (\line -> length line <= filterLength) (lines contents)
  writeFile destPath filteredContent

main :: IO ()
main = do
  putStrLn "Введите данные в таком формате: "
  putStrLn "просмотр файла - :main viewFile [имя входного файла]"
  putStrLn "добавление информации в файл - :main appendDataFile [имя входного файла] [добавляемая информация]"
  putStrLn "удаление строки из файла - :main removeLineFromFile [имя входного файла] [номер строки]"
  putStrLn "Копирование файла с фильтром - :main copyFileWithLengthFilter [имя входного файла] [длина строки] [имя выходного файла]"

  listArgs <- getArgs

  case (listArgs !! 0) of
    "viewFile" -> viewFile (listArgs !! 1)
    "appendDataFile" -> appendDataFile (listArgs !! 1) (listArgs !! 2)
    "removeLineFromFile" -> removeLineFromFile (listArgs !! 1) (read (listArgs !! 2) :: Int)
    "copyFileWithLengthFilter" -> copyFileWithLengthFilter (listArgs !! 1) (listArgs !! 3) (read (listArgs !! 2) :: Int)
