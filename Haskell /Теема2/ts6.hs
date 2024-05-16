import System.IO
-- Найти сумму F(n)=∑i=1nn−i
sumFunc :: Int -> Int
sumFunc n = sum [n - x | x <- [1..n]]

main :: IO ()

main = do
  let n = 5
  print(sumFunc n)
