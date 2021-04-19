-- Data.Char 
import Data.Char 
-- 1: 
-- isUpper :: Char -> Bool
-- toUpper :: Char -> Char

-- 2:
filterUpper :: String -> String
filterUpper = filter isUpper

-- 3: 
capitalize :: String -> String
capitalize [] = []
capitalize (x:xs) = toUpper x:xs

-- 4:
shout :: String -> String
shout [] = []
shout (x:xs) = toUpper x : shout xs

-- 5: 
-- head :: [a] -> a
capHead :: String -> Char
capHead str = toUpper (head str)

-- 6.
capHead' :: String -> Char
capHead' str = toUpper . head $ str 

capHead'' :: String -> Char
capHead'' = toUpper . head

-- Writing your own standard functions

-- 1: 
myOr :: [Bool] -> Bool
myOr []     = False
myOr (x:xs) = x || myOr xs

-- 2:
myAny :: (a -> Bool) -> [a] -> Bool
myAny _ []                  = False
myAny f (x:xs) | f x        = True
myAny f (x:xs) | not (f x)  = myAny f xs

-- 3: 
myElem :: Eq a => a -> [a] -> Bool
myElem _ []                 = False
myElem y (x:xs) | x == y    = True
myElem y (x:xs) | x /= y    = myElem y xs

myElem' :: Eq a => a -> [a] -> Bool
myElem' x = myAny ( == x)

-- 4:
myReverse :: [a] -> [a]
myReverse []        = []
myReverse (x:xs)    = myReverse xs ++ [x]

-- 5:
squish :: [[a]] -> [a]
squish []       = []
squish (x:xs)   = x ++ squish xs

-- 6: 
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap f = squish . map f

-- 7: 
squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

-- 8: 
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy _ [] = error "Empty list has no maximum element!"
myMaximumBy ord (x:xs) = go ord xs x where 
    go _ [] max = max
    go ord (x:xs) max | ord x max == GT = go ord xs x
    go ord (x:xs) max | ord x max /= GT = go ord xs max

-- 9: 
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy _ [] = error "Empty list has no minimum element!"
myMinimumBy ord (x:xs) = go ord xs x where 
    go _ [] max = max
    go ord (x:xs) max | ord x max == LT = go ord xs x
    go ord (x:xs) max | ord x max /= LT = go ord xs max

-- 10:
myMaximum :: (Ord a) => [a] -> a
myMaximum = myMaximumBy compare

myMinimum :: (Ord a) => [a] -> a
myMinimum = myMinimumBy compare