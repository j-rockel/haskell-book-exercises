# Chapter 5: Types

### Multiple Choice 
1 -> c 

2 -> a

3 -> b

4 -> c

### Determine the Type 
#### 1: 
a: `(* 9) 6 :: Num a => a`

b: `head [(0, "doge), (1, "kitteh")] :: (Num a) => (a, [Char])`

c: `head [(0 :: Integer, "doge"), (1, "kitteh")] :: (Integer, [Char])`

d: `if False then True else False :: Bool`

e: `length [1, 2, 3, 4, 5] :: Int` 

f: `(length [1, 2, 3, 4, 5]) > (length "TACOCAT") :: Bool`

#### 2: 
`w :: Num a => a`

#### 3: 
`z :: Num a => a -> a`

#### 4:
`f :: Fractional a => a`

#### 5: 
`f :: [Char]`

(also see DetermineTheType.hs)

### Does it compile? 

1: doesn't compile, problem in `wahoo = bigNum $ 10`: bigNum is not a function so cannot be applied to an argument. Could be `wahoo = bigNum ^ 10` ?

2: compiles 

3: doesn't compile, b is not a function (and neither is c). Could be `c = a b 10` and `d = a c 200`.

4: doesn't compile, c is unknown. Would compile with (for example) `c = 1`.

(see DoesItCompile.hs for implemented fixes)

### Type variable or specific type constructor? 
`f :: zed -> Zed -> Blah`: `zed` is fully polymorphic, `Zed` and `Blah` are concrete. 

`f :: Enum b => a -> b -> c` : `a` and `c` are fully polymorphic, `b` is constrained polymorphic (`Enum`). 

`f :: f -> g -> C`: `f` and `g` are fully polymorphic, `C` is concrete. 

### Write a type signature
1: `functionH :: [a] -> a`

2: `functionC :: Ord a => a -> a -> Bool`

3: `functionS :: (a, b) -> b` 

### Given a type, write the function
see writeTheFunction.hs

### Fix it
see FixIt.hs

### Type Kwon Do
see TypeKwonDo.hs