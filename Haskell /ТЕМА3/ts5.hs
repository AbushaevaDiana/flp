import System.IO
-- Напишите функцию, берущую список списков и возвращающую 
--   список из N -х элементов подсписков с помощью функций map и (!!)
getNthElements :: Int -> [[a]] -> [a]
getNthElements n [] = []
getNthElements n list 
  | n >= 0 = map (\sublist -> sublist !! n) list
  | otherwise = error "output the ranges"

main :: IO ()

main = do
  let n = 1
  let list = [[1,2,3], [4,5,6,7], [8,9]]
  print(getNthElements n list)
