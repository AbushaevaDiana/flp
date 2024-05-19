import Data.List(delete)
import System.Environment
import System.Directory
import System.IO
import Data.Char(isDigit)
--3. Программа работы с файлом предусматривает: 
--просмотр содержимого, добавление новой информации,
--удаление какой-либо строки, копирование содержимого в
--новый файл с использованием двух видов фильтрации 

viewFile :: String -> IO ()
viewFile inFileName = do
  content <- readFile inFileName
  putStrLn $ "Файл " ++ show inFileName ++ " содержит следующую информацию:"
  putStrLn content

appendDataFile :: String -> String -> IO ()
appendDataFile inFileName newContent = do
  appendFile inFileName (newContent ++ "\n")
  putStrLn $ "В файл " ++ show inFileName ++ " была добавлена строка:" ++ show newContent

removeLineFromFile :: String -> Int -> IO ()
removeLineFromFile inFileName lineNumber = do
  if lineNumber <= 0 
    then putStrLn "Недопустимый номер строки"
    else do
      input <- readFile inFileName
      let lineList = lines input
      if length lineList < lineNumber
        then putStrLn "Номер строки привышает количество строк в файле"
        else do
          let output = unlines $ delete (lineList !! (lineNumber - 1)) lineList
          writeFile inFileName output
          putStrLn $ "Из файла " ++ show inFileName ++ " была удалена строка с номером:" ++ show lineNumber

copyFileWithLengthFilter :: String -> String -> Int -> IO ()
copyFileWithLengthFilter inFileName outputFileName filterLength = do
  outputFileExists <- doesFileExist outputFileName 
  if not outputFileExists
    then putStrLn $ "Файл " ++ show outputFileName ++ " не найден"
    else do
      input <- readFile inFileName
      let output = unlines $ filter (\line -> length line <= filterLength) (lines input)
      writeFile outputFileName output
      putStrLn $ "Строки длина которых не превышает " ++ show filterLength ++ " из файла" ++ show inFileName ++ " скопированы в файл:" ++ show outputFileName

copyFileWithDigitFilter :: String -> String -> IO ()
copyFileWithDigitFilter inFileName outputFileName = do
  outputFileExists <- doesFileExist outputFileName 
  if not outputFileExists
    then putStrLn $ "Файл " ++ show outputFileName ++ " не найден"
    else do
      input <- readFile inFileName
      let output = unlines $ filter (\line -> isDigit (head line)) (lines input)
      writeFile outputFileName output
      putStrLn $ "Строки начинающиеся с цифры, из файла" ++ show inFileName ++ " скопированы в файл:" ++ show outputFileName

main :: IO ()
main = do
  putStrLn "Подсказка: "
  putStrLn "просмотр файла - viewFile"
  putStrLn "добавление информации в файл - appendDataFile"
  putStrLn "удаление строки из файла - removeLineFromFile"
  putStrLn "копирование файла с фильтром по длине строки - copyFileWithLengthFilter"
  putStrLn "копирование строк файла, которые начинаются с цифры - copyFileWithDigitFilter"
  
  args <- getArgs
  if length args < 1
    then putStrLn "Неверное количество входных параметров"
    else do
    let inFileName = args !! 0
    inputFileExists <- doesFileExist inFileName 
    if not inputFileExists
      then putStrLn "Файл не найден"
      else do
        putStrLn "Введите вид работ согласно подсказке: "
        functionName <- getLine
        case (functionName) of
          "viewFile" -> viewFile inFileName
          "appendDataFile" -> do
            putStrLn "Введите строку, которую хотите добавить: "
            newContent <- getLine
            appendDataFile inFileName newContent
          "removeLineFromFile" -> do
            putStrLn "Введите номер строки, которую хотите удалить: "
            lineNumber <- getLine
            removeLineFromFile (inFileName) (read (lineNumber) :: Int)
          "copyFileWithLengthFilter" -> if length args < 2
            then putStrLn "Неверное количество входных параметров для этой функции"
            else do
              putStrLn "Введите максимальную длину строки для копирования: "
              filterLength <- getLine
              copyFileWithLengthFilter inFileName (args !! 1) (read (filterLength) :: Int)
          "copyFileWithDigitFilter" -> if length args < 2
            then putStrLn "Неверное количество входных параметров для этой функции"
            else copyFileWithDigitFilter inFileName (args !! 1)
          _ -> putStrLn "Не найдено такой команды"

--Формат ввода: :main <входящий файл> <выходящий файл>