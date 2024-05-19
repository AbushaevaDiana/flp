import System.IO
import Data.List
-- 2. Пифагорова тройка это три такие натуральные числа a < b < c, 
-- что a^2 + b^2 = c^2 Например, 3^2 + 4^2 = 9 + 16 = 25 = 5^2. 
-- Найдите единственную Пифагорову тройку, такую что a + b + c = 1000 
-- и вычислите произведение abc. #5

findPythagoreanTriplet :: Int -> (Int, Int, Int)
findPythagoreanTriplet sumOfAbc =
    head [(a, b, c) | 
        a <- [1 .. sumOfAbc],
        b <- [a + 1 .. sumOfAbc],
        let c = sumOfAbc - (a + b),
        a ^ 2 + b ^ 2 == c ^ 2
        ]

main :: IO ()
main = do
    let (a, b, c) = findPythagoreanTriplet 1000
    putStrLn "Пифагорова тройка: "
    print(a, b, c)
    putStrLn $ "Произведение abc: " 
    print(a * b * c)
