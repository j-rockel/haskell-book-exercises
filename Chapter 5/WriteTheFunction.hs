module WriteTheFunction where
-- Given a type, write the function

-- 1. 
i :: a -> a
i = id

-- 2. 
c :: a -> b -> a
c x _ = x

-- 3. yes
c'' :: b -> a -> b
c'' = c

-- 4.
c' :: a -> b -> b
c' _ y = y 

-- 5.
r :: [a] -> [a]
r = reverse 

-- 6. 
co :: (b -> c) -> (a -> b) -> a -> c
co bToC aToB a = bToC (aToB a)

-- 7. 
a :: (a -> c) -> a -> a
a _ a = a 

-- 8. 
a' :: (a -> b) -> a -> b
a' aToB = aToB