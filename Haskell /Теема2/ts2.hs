import System.IO
-- insert (L,A,n) - функция включения в список L заданного атома А на определенную позицию n
insert :: [a] -> a -> Int -> [a]
insert l a n 
    | n < 0 = error "Negative index is not possible for an array"
    | otherwise = (take n l) ++ [a] ++ (drop n l)

main :: IO ()

main = do
  let list = [1, 3, 4, 5]
  let atom = -2
  let n = -1
  print( insert list atom n )
