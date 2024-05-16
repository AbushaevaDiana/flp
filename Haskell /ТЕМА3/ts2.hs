import System.IO
-- Определите функцию secondlastlist. Эта функция берет список списков и возвращает последние элементы каждого, объединенные  в список
secondlastlist :: [[a]] -> [a]
secondlastlist [] = []
secondlastlist (hx:x) | length hx == 0 = secondlastlist x
                      | otherwise = last hx : secondlastlist x

main :: IO ()

main = do
  let list = [[1], [], [4,5,6], [0, 7]] 
  print(secondlastlist list)
