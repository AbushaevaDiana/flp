import System.IO
-- Найти сумму F(n)=∑i=1ni
summDoN :: Int -> Int
summDoN n = sum [1..n]

main :: IO ()

main = do
  let n = 3
  print(summDoN n)
