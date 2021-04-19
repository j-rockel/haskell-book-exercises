# Chapter 4: Basic Datatypes

#### 1: 
`length :: [a] -> Int`

#### 2: 
a -> 5 

b -> 3 

c -> 2 

d -> 5

#### 3 & 4:
`6 / length [1, 2, 3]` won't work because `length [1, 2, 3] :: Int` and `Int` is not an instance of `Fractional`, but  `div 6 (length [1, 2, 3])` will work.

#### 5: 
`2 + 3 == 5 :: Bool`, and we would expect it to evaluate to `True`. 

#### 6: 
`x + 3 == 5 :: Bool`, and we would expect it to evaluate to `False`. 

#### 7: 
`length allAwesome == 2` -> works, returns `True`

`length [1, 'a', 3, 'b']` -> error bc type of list cannot be deduced 

`length allAwesome + length awesome` -> works, returns 5

`(8 == 8) && ('b' < 'a')` -> works, returns `False` bc ASCII value of 'a' is smaller than that of 'b'

`(8 == 8) && 9` -> won't work bc 9 is not a `Bool`

#### 8 - 10: 
see Ch4.hs

### Correcting Syntax
see Ch4.hs

### Match the function names to their types 
1: `show` -> c) `Show a => a -> String`

2: `(==)` -> b) `Eq a => a -> a -> Bool`

3: `fst` -> a) `(a, b) -> a`

4: `(+)` -> d) `Num a => a -> a -> a`