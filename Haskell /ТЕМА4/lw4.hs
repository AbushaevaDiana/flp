import System.IO
import qualified Data.Map as Map
import qualified Data.Set as Set
import qualified Data.Char as Char


-- Собственная реализация функции transpose
myTranspose :: [[a]] -> [[a]]
myTranspose [] = []
myTranspose ([]:_) = []
myTranspose x = map head x : myTranspose (map tail x)

-- Собственная реализация функции singleton
mySingleton :: Ord k => k -> a -> Map.Map k a
mySingleton key value = Map.fromList [(key, value)]

-- Собственная реализация функции union
myUnion :: Ord a => Set.Set a -> Set.Set a -> Set.Set a
myUnion s1 s2 = Set.foldr Set.insert s1 s2

-- Собственная реализация функции isControl
myIsControl :: Char.Char -> Bool
myIsControl c = (Char.ord c) < 32 || (Char.ord c) == 127

-- Собственная реализация функции isLower
myIsLower :: Char.Char -> Bool
myIsLower c = Char.ord c >= Char.ord 'a' && Char.ord c <= Char.ord 'z'

main :: IO ()

main = do
  let matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9, 8]]
  print(myTranspose matrix)
-- Ожидаемый вывод: [[1,4,7],[2,5,8],[3,6,9]]

  let nonSquareMatrix = ["hey","the","guy"]
  print (myTranspose nonSquareMatrix)
-- Ожидаемый вывод: [[1,3,5],[2,4,6]]

  print (mySingleton 1 "4")
-- Ожидаемый вывод: fromList [(1,"4")]

  print (mySingleton [1] "4")
-- Ожидаемый вывод: fromList [([1],"4")]

  print(myUnion (Set.fromList " .?AIRadefhijlmnorstuy") (Set.fromList " !Tabcdefghilmnorstuvwy"))
-- Ожидаемый вывод: " !.?AIRTabcdefghijlmnorstuvwy"

  print(myUnion (Set.empty) (Set.fromList " !Tabcdefghilmnorstuvwy"))
-- Ожидаемый вывод: " !.?AIRTabcdefghijlmnorstuvwy"

  print(myIsControl 'A')
-- Ожидаемый вывод: False

  print(myIsControl '\n')
-- Ожидаемый вывод: True

  print(myIsLower 'a')
-- Ожидаемый вывод: True

  print(myIsLower '9')
-- Ожидаемый вывод: False
