### Задание 1  
```
let x = (( 1, 'a'), "abc")
print(snd(fst(x)))
```
![image](https://github.com/AbushaevaDiana/flp/assets/79981087/abbc2742-799e-4b10-8678-bf172f0bf9c4)
![image](https://github.com/AbushaevaDiana/flp/assets/79981087/ad900532-792f-47d2-92bc-4c655868d3f4)

--- 
### Задание 2
#### 1
```
let x = ['a', 'b', 'c']
print(head(tail(x)))
```
![image](https://github.com/AbushaevaDiana/flp/assets/79981087/44090185-8ebe-483d-b3d2-132f7e3999b2)
![image](https://github.com/AbushaevaDiana/flp/assets/79981087/22d78168-12e2-4f07-a60b-c79df6c0c0ff)

#### 2
```
let x = [['a', 'b'], ['c','d']]
print(head(tail(head(x))))
```
![image](https://github.com/AbushaevaDiana/flp/assets/79981087/1bcc3096-a9bd-4ebf-9388-6acff2e26c66)
![image](https://github.com/AbushaevaDiana/flp/assets/79981087/dec41405-d048-4a1c-8140-cd6814c71b7f)

#### 3
```
let x = [['a', 'c', 'd'], ['a','b']]
print(head(tail(head(tail(x)))))
```
![image](https://github.com/AbushaevaDiana/flp/assets/79981087/59fa1ca6-537d-45e4-a626-f7e2c90a5b5a)

#### 4
```
let x =  [['a','d'], ['b', 'c']]
print(head(head(tail(x))))
```
![image](https://github.com/AbushaevaDiana/flp/assets/79981087/c1cbb117-9033-4fab-bd99-1ae998ec4613)

---
### Задание 3

#### 1)
```
createListOfOddNaturalNumbers :: Integer -> [Integer]
createListOfOddNaturalNumbers x = [1, 3..2*x-1] 
main :: IO ()
main =  do print(createListOfOddNaturalNumbers 20)
```
![image](https://github.com/AbushaevaDiana/flp/assets/79981087/9c2cff77-c08e-4915-a813-d76928ac83c0)

#### 2)
```
createListOfOddNaturalNumbers :: Integer -> [Integer]
createListOfOddNaturalNumbers x = filter odd [1..2 * x]
main :: IO ()
main =  do print(createListOfOddNaturalNumbers 20)
```
![image](https://github.com/AbushaevaDiana/flp/assets/79981087/bff1faec-7d87-4ab6-a661-72dfe53c50e8)

#### 3)
```
isOdd :: Integer -> Bool
isOdd x = (mod x 2) /= 0
createListOfOddNaturalNumbers :: Integer -> [Integer]
createListOfOddNaturalNumbers x = filter isOdd [1..2 * x]
main :: IO ()
main =  do let x = 20
           print(createListOfOddNaturalNumbers x)
```
![image](https://github.com/AbushaevaDiana/flp/assets/79981087/ccc21b59-3f5b-4465-a278-dac367c0be59)

---
### Задание 4
```
toTriangular :: Integer -> Integer
toTriangular x = x*(x+1) `div` 2
main :: IO ()
main =  do let count = 50
           let listOfTriangularFermatNumbers = map toTriangular [1..count]
           print(listOfTriangularFermatNumbers)
```
![image](https://github.com/AbushaevaDiana/flp/assets/79981087/005ea081-83b7-4e57-917e-ae993b061743)

---
### Задание 5
