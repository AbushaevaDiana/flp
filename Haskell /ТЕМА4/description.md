1)
Название: List.transpose  
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
Название: Map.singleton  
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

3)
Название: Set.union  
Тип: Set a -> Bool 
Описание: обьединяет два множества в одно
Примеры:  
1)   
Set.union (fromList " .?AIRadefhijlmnorstuy") (fromList " !Tabcdefghilmnorstuvwy")   
Результат: " !.?AIRTabcdefghijlmnorstuvwy"
2)  
Set.union (Set.empty) (Set.fromList " !Tabcdefghilmnorstuvwy")  
Результат: " !Tabcdefghilmnorstuvwy"
3)  
Set.union (Set.fromList [3,4,5,3, 4,5]) (Set.fromList [1, 1, 1, 5])  
Результат: [1,3,4,5] 

Реализация:   
```
myUnion :: Ord a => Set.Set a -> Set.Set a -> Set.Set a
myUnion s1 s2 = Set.foldr Set.insert s1 s2

```
---
4)
Название: Char.isControl 
Тип: Char -> Bool 
Описание:  проверяет, является ли указанный символ управляющим символом
Примеры:  
1)   
Char.isControl 'A'
Результат: False
2)  
Char.isControl '\n'
Результат: True
3)  
Char.isControl '9'
Результат: False

Реализация:   
```
myIsControl :: Char.Char -> Bool
myIsControl c = (Char.ord c) < 32 || (Char.ord c) == 127

```
---

5)
Название: Char.isLower 
Тип: Char -> Bool 
Описание:  проверяет, является ли указанный символ управляющим символом
Примеры:  
1)   
Char.isLower 'A'
Результат: False
2)  
Char.isLower 'a'
Результат: True
3)  
Char.isLower '9'
Результат: False

Реализация:   
```
myIsLower :: Char.Char -> Bool
myIsLower c = Char.ord c >= Char.ord 'a' && Char.ord c <= Char.ord 'z'

```
---

Вопросы

	
Результат выражения: Set.union


Результат выражения: transpose

```
---
