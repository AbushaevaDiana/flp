import System.IO
-- listSumm(L1,L2) - функция сложения элементов двух списков. Возвращает список, составленный из сумм элементов списков - параметров L1, L2. Учесть, что переданные списки могут быть разной длины

listSumm :: [Int] -> [Int] -> [Int]
listSumm [] [] = []
listSumm x [] = x
listSumm [] y = y
listSumm (hx:x) (hy:y) = (hx + hy) : listSumm x y

main :: IO ()

main = do
  let list1 = [1, 3, 5, 7]
  let list2 = [2, 4, 6]
  print(listSumm list1 list2)
