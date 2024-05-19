import System.IO
import System.Environment
import Data.Char
import System.Directory
-- Скопировать информацию из одного файла в другой, 
-- заменив знаки  пунктуации заданным с клавиатуры  символом. 
-- Имена файлов указываются в командной строке.
replacePunctuation :: String -> String -> Char -> IO ()
replacePunctuation inFileName outputFileName replaceChar = do
    input <- readFile inFileName
    let output = map (\c -> if isPunctuation c then replaceChar else c) input
    writeFile outputFileName output

main :: IO()
main = do
  args <- getArgs
  if length args /= 3
    then putStrLn "Неверное количество входных параметров"
    else do
      let inFileName = args !! 0
      let outputFileName = args !! 1
      let replaceChar = head (args !! 2)
      inputFileExists <- doesFileExist inFileName 
      outputFileExists <- doesFileExist outputFileName 
      if not (inputFileExists && outputFileExists)
        then putStrLn "Файлы не найдены"
        else do
          replacePunctuation inFileName outputFileName replaceChar
          putStrLn $ "Пунктуация из входного файла " ++ show inFileName ++ " была заменена на символ " ++ show replaceChar ++ " в выходном файле " ++ show outputFileName

--"Формат ввода: :main <входящий файл> <выходящий файл> <символ, на который заменяем>"
