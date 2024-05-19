import System.IO

-- Собственная реализация функции transpose
myTranspose :: [[a]] -> [[a]]
myTranspose [] = []
myTranspose ([]:_) = []
myTranspose x = map head x : myTranspose (map tail x)

main :: IO ()

main = do
  let matrix = [[1,2,3],[4,5,6]]
  print(myTranspose matrix)
-- Ожидаемый вывод: [[1,4],[2,5],[3,6]]
