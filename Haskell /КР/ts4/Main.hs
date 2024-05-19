import System.IO
import System.Environment
import Data.Char
import System.Directory
import Data.List
-- 4.Напишите функцию, которая читает входной текстовый файл и проверяет, 
-- правильно ли в тексте расставлены скобки 
-- (для каждой открывающей есть своя правильная закрывающая). #5

checkBrackets :: String -> Bool
checkBrackets x = checkBracketsUseStack x []

checkBracketsUseStack :: String -> String -> Bool
checkBracketsUseStack [] [] = True
checkBracketsUseStack [] _  = False
checkBracketsUseStack (x:xs) stack
    | isOpeningBracket x = checkBracketsUseStack xs (x:stack)
    | isClosingBracket x = if length stack > 0 && isMatchingBracket (head stack) x
                             then checkBracketsUseStack xs (tail stack)
                             else False
    | otherwise = checkBracketsUseStack xs stack

isOpeningBracket :: Char -> Bool
isOpeningBracket x = elem x "([{"

isClosingBracket :: Char -> Bool
isClosingBracket x = elem x ")]}"

isMatchingBracket :: Char -> Char -> Bool
isMatchingBracket '(' ')' = True
isMatchingBracket '[' ']' = True
isMatchingBracket '{' '}' = True
isMatchingBracket _ _ = False

main :: IO()
main = do
  args <- getArgs
  if length args /= 1
    then putStrLn "Неверное количество входных параметров"
    else do
      let inFileName = args !! 0
      inputFileExists <- doesFileExist inFileName 
      if not inputFileExists
        then putStrLn "Файл не найден"
        else do
          input <- readFile inFileName
          let result = checkBrackets input
          if result 
            then putStrLn "Скобки верны"
            else putStrLn "Ошибка в скобках"

--Формат ввода: :main <входящий файл>