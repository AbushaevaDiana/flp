import Data.List(delete)
import System.Environment
import System.IO
import Data.Char(isDigit)

viewFile :: String -> IO ()
viewFile inFileName = do
  content <- readFile inFileName
  putStrLn $ "Файл " ++ inFileName ++ " содержит следующую информацию:" 
  putStrLn content

appendDataFile :: String -> String -> IO ()
appendDataFile inFileName newContent = do
  appendFile inFileName (newContent ++ "\n")
  putStrLn $ "В файл " ++ inFileName ++ " была добавлена строка:"  ++ newContent

removeLineFromFile :: String -> Int -> IO ()
removeLineFromFile inFileName lineNumber = do
  if lineNumber <= 0 
    then putStrLn "Недопустимый номер строки"
    else do
      input <- readFile inFileName
      let lineList = lines input
      if length lineList < (lineNumber - 1)
        then putStrLn "Номер строки привышает количество строк в файле"
        else do
          let output = unlines $ delete (lineList !! (lineNumber - 1)) lineList
          writeFile inFileName output

copyFileWithLengthFilter :: String -> String -> Int -> IO ()
copyFileWithLengthFilter inFileName outputFileName filterLength = do
  input <- readFile inFileName
  let output = unlines $ filter (\line -> length line <= filterLength) (lines input)
  writeFile outputFileName output
  putStrLn
  putStrLn $ "Строки длина которых не превышает " ++ filterLength " из файла" ++ inFileName ++ " скопированы в файл:"  ++ outputFileName

copyFileWithLengthFilter :: String -> String -> Int -> IO ()
copyFileWithLengthFilter inFileName outputFileName filterLength = do
  input <- readFile inFileName
  let output = unlines $ filter (\line -> isDigit (head line)) (lines input)
  writeFile outputFileName output
  putStrLn
  putStrLn $ "Строки начинающиеся с цифры, из файла" ++ inFileName ++ " скопированы в файл:"  ++ outputFileName

main :: IO ()
main = do
  putStrLn "Подсказка: "
  putStrLn "просмотр файла - :main viewFile [имя входного файла]"
  putStrLn "добавление информации в файл - :main appendDataFile [имя входного файла] [добавляемая информация]"
  putStrLn "удаление строки из файла - :main removeLineFromFile [имя входного файла] [номер строки]"
  putStrLn "копирование файла с фильтром по длине строки - :main copyFileWithLengthFilter [имя входного файла] [длина строки] [имя выходного файла]"
  putStrLn "копирование строк файла, которые начинаются с цифры - :main copyFileWithDigitFilter [имя входного файла] [имя выходного файла]"
  putStrLn "Результат: "

  args <- getArgs
  if length args < 2
    then putStrLn "Неверное количество входных параметров"
    else do
    listArgs <- getArgs
    let functionName = args !! 0
    let inFileName = args !! 1
    inputFileExists <- doesFileExist inFileName 
    if not inputFileExists
      then putStrLn "Файл не найден"
      else do
        case (functionName) of
          "viewFile" -> viewFile (inFileName)
          "appendDataFile" -> appendDataFile (inFileName) (listArgs !! 2)
          "removeLineFromFile" -> removeLineFromFile (inFileName) (read (listArgs !! 2) :: Int)
          "copyFileWithLengthFilter" -> copyFileWithLengthFilter (inFileName) (listArgs !! 3) (read (listArgs !! 2) :: Int)
          "copyFileWithDigitFilter" -> copyFileWithDigitFilter (inFileName) (listArgs !! 3)
