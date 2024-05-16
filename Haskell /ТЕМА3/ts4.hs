import System.IO
import Data.List (nub, delete)
-- Определите функцию mysubst. Получив два списка, она возвращает их разность. 
--  Разность двух списков называется список, состоящий из элементов  первого списка, 
--  которые не принадлежат второму списку.
mysubst :: (Eq a) => [a] -> [a] -> [a]
mysubst [] y = (deleteDublicate y)
mysubst x [] = (deleteDublicate x)
mysubst x y = mysubstWhithoutDublicate (deleteDublicate x) y

mysubstWhithoutDublicate :: (Eq a) => [a] -> [a] -> [a]
mysubstWhithoutDublicate x [] = x
mysubstWhithoutDublicate x (hy:y)
    | hy `elem` x = mysubstWhithoutDublicate (delete hy x) y
    | otherwise = mysubstWhithoutDublicate x y

deleteDublicate :: Eq a => [a] -> [a] 
deleteDublicate = nub  

main :: IO ()
  
main = do
  let list1 = [1,2,3,3,4,5]
  let list2 = [4,5,6,7,7]
  print(mysubst list1 list2)
