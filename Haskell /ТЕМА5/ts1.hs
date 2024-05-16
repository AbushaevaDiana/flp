import System.IO
-- Вывести на экран сформированный список, данные для которого вводятся с клавиатуры: начальное значение, количество элементов, кратность.
generateList :: Int -> Int -> Int -> [Int]
generateList initialValue numElements multipleFactor = [initialValue, initialValue + multipleFactor .. initialValue + (numElements - 1) * multipleFactor]

main :: IO ()

main = do
  putStrLn "Введите начальное значение: "
  start <- readLn
  putStrLn "Введите количество элементов: "
  count <- readLn
  putStrLn "Введите кратность:"
  factor <- readLn

  let result = generateList start count factor

  putStrLn "Список:"
  print result
