import System.IO
--здесь описание ваших функций
oddEven :: [Int] -> [Int]
oddEven []  = []
oddEven [x] = [x]
oddEven (x:y:xs) = y:x:oddEven xs

main :: IO ()
  
main = do
  let list = [2,5,7,9,1,8] :: [Int] 
  print(oddEven list)
