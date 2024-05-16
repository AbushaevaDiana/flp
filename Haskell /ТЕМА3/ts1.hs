import System.IO
-- Определите функцию listnums. Она берет численный аргумент n и возвращает список всех чисел от n до 1, включительно

listnums :: Int -> [Int]
listnums n | n == 1 = [1] 
           | n <= 0 = n : listnums (n + 1)
           | otherwise = n : listnums (n - 1)

main :: IO ()

main = do
  let n = 10 
  print(listnums n)
