import System.IO
-- position (L,A) - возвращает номер первого вхождения заданного атома А в список L

position :: (Eq atom) => [atom] -> atom -> Int
position [] atom = error "Empty array"
position list atom = positionN list atom 0

positionN :: (Eq atom) => [atom] -> atom -> Int -> Int
positionN list atom n
  | n > (length list - 1) = error "Not found"
  | atom == (list !! n) = n
  | atom /= (list !! n) = positionN list atom (n + 1)

main :: IO ()

main = do
  let list = [1, 2, 3]
  let atom = 1
  print(position list atom)
