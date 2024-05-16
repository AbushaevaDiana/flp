import System.IO
import Data.List (nub)
-- Определите функцию myunion, которая находит объединение двух списков. 
--   Объединением двух списков будет список содержащий элементы, 
--   которые есть по крайней мере в одном из списков
myunion :: (Eq a) => [a] -> [a] -> [a]
myunion [] y = (deleteDublicate y)
myunion x [] = (deleteDublicate x)
myunion x (hy:y)
    | hy `elem` x = myunion x y
    | otherwise = myunion (hy:x) y

deleteDublicate :: Eq a => [a] -> [a] 
deleteDublicate = nub  

main :: IO ()

main = do
  let list1 = [1,2,3,3,4,5]
  let list2 = [4,5,6,7,7]
  print(myunion list1 list2)
