-- Warm-up and review 
-- 1.
combine3 :: [a] -> [b] -> [c] -> [(a, b, c)]
combine3 l1 l2 l3 = concat . concat . concat $ map (\z -> map (\y -> map (\x -> [(x, y, z)]) l1 ) l2 ) l3

stops = "pbtdkg"
vowels = "aeiou"

stopVowelStop :: [(Char, Char, Char)]
stopVowelStop = combine3 stops vowels stops

pVowelStop :: [(Char, Char, Char)]
pVowelStop = combine3 "p" vowels stops

nouns = ["house", "cat", "sky", "person"]
verbs = ["runs", "watches", "eats", "knows"]

nounVerbNoun :: [(String, String, String)]
nounVerbNoun = combine3 nouns verbs nouns

-- 2. 
seekritFunc x =
    div (sum (map length (words x)))
        (length (words x))
-- calculates the (rounded down to the nearest integer) mean word length in the string x

-- 3. 
seekritFuncMoreExact x =
    realToFrac (sum (map length (words x))) / realToFrac (length (words x))


-- Rewriting functions using folds
-- many of these are not pointfree, but i don't know how to improve them 

-- 1.
myOr :: [Bool] -> Bool
myOr = foldl (||) False

-- 2.
myAny :: (a -> Bool) -> [a] -> Bool
myAny f = foldr ((||) . f) False -- would like to make this myOr . map but it doesnt work for ??? reasons

-- 3.
myElem :: Eq a => a -> [a] -> Bool
myElem x = foldr ((||) . (== x)) False

-- 4. 
myReverse :: [a] -> [a]
myReverse = foldl (flip (:)) []

-- 5. 
myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr ((:) . f) []

-- 6.
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f [] = []
myFilter f (x:xs) = if f x then x : myFilter f xs else myFilter f xs

myFilter' :: (a -> Bool) -> [a] -> [a]
myFilter' f = foldr (\x -> if f x then (x :) else id) []

-- 7. 
squish :: [[a]] -> [a]
squish = foldr (++) [] 

-- 8.
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap f = foldr ((++) . f) []

-- 9. 
squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

-- 10. 
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy f (x:xs) = foldl (pickLarger f) x xs where 
    pickLarger f a b = if f a b == GT then a else b

-- 11. 
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy f (x:xs) = foldl (pickSmaller f) x xs where 
    pickSmaller f a b = if f a b == LT then a else b