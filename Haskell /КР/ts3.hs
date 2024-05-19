import System.IO
import qualified Data.Map as Map

-- Собственная реализация функции transpose
myTranspose :: [[a]] -> [[a]]
myTranspose [] = []
myTranspose ([]:_) = []
myTranspose x = map head x : myTranspose (map tail x)
