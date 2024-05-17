import System.IO


-- Собственная реализация функции transpose
myTranspose :: [[a]] -> [[a]]
myTranspose [] = []
myTranspose ([]:_) = []
myTranspose x = (map head x) : myTranspose (map tail x)

main :: IO ()

main = do
  let matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  print $ myTranspose matrix
-- Ожидаемый вывод: [[1,4,7],[2,5,8],[3,6,9]]

  let nonSquareMatrix = [[1, 2], [3, 4], [5, 6]]
  print $ myTranspose nonSquareMatrix
-- Ожидаемый вывод: [[1,3,5],[2,4,6]]
