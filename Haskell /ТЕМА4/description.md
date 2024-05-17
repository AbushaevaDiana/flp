1)
Название: transpose  
Тип: [[a]] -> [[a]] 
Описание: принимает 2d  матрицу и транспонирует строки и столбцы своего аргумента 
Примеры:  
1)   
transpose [[1,2,3],[4,5,6],[7,8,9]]  
Результат: [[1,4,7],[2,5,8],[3,6,9]]  
2)  
transpose ["hey","the","guy"]  
Результат: ["htg","ehu","yey"] 
3)  
transpose [[1]]  
Результат: [[[1]] 

Реализация:   
```
myTranspose :: [[a]] -> [[a]]
myTranspose [] = []
myTranspose ([]:_) = []
myTranspose x = (map head x) : myTranspose (map tail x)

```
---
2)
Название: singleton  
Тип: k -> a -> Map k a 
Описание: принимает на вход два элемента и возвращает словарь с единственным элементом у которого ключ это первый принятый элемент,
а значение второму принятому элементу
Примеры:  
1)   
singleton 1 'a'   
Результат: fromList [(1, 'a')]  
2)  
singleton "4" "4"  
Результат: fromList [("4","4")]
3)  
singleton [1] "4"  
Результат: fromList [([1],"4")] 

Реализация:   
```
mySingleton :: Ord k => k -> a -> Map.Map k a
mySingleton key value = Map.fromList [(key, value)]

```
---
