import System.IO
-- Вывести на экран сформированный список, 
-- данные для которого вводятся с клавиатуры: начальное значение, количество элементов, кратность.
generateList :: Int -> Int -> Int -> [Int]
generateList start count factor = 
    take count [x | x <- [start, start + 1 ..], mod x factor == 0]

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
