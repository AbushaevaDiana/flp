import System.IO
-- oddEven(L) -  функция перестановки местами соседних элементов списка L  (Например, список [2,5,7,9,1,8]  после преобразования будет иметь вид [5,2,9,7,8,1]) 
oddEven :: [Int] -> [Int]
oddEven []  = []
oddEven [x] = [x]
oddEven (x:y:xs) = y:x:oddEven xs

main :: IO ()
  
main = do
  let list = [2,5,7,9,1,8] :: [Int] 
  print(oddEven list)
