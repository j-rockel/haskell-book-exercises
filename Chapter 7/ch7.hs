
-- Let's write code
-- 1: 
{- 
tensDigit :: Integral a => a -> a
tensDigit x = d where
    xLast = x `div` 10 
    d = xLast `mod` 10 -}

tensDigit :: Integral a => a -> a
tensDigit x = d where
    (a, b) = x `divMod` 10
    (c, d) = a `divMod` 10

-- yes, this has the same type

hunsDigit :: Integral a => a -> a
hunsDigit x = d where
    (a, b) = x `divMod` 100
    (c, d) = a `divMod` 10

-- 2: 
-- case expression: 
foldBool1 :: a -> a -> Bool -> a
foldBool1 x y returnFirst = case returnFirst of 
    True -> x
    False -> y

-- guard:
foldBool2 :: a -> a -> Bool -> a
foldBool2 x _ b | b      = x
foldBool2 _ y b | not b  = y

-- 3:
g :: (a -> b) -> (a, c) -> (b, c)
g f (x, y) = (f x, y) 

-- 4: 
-- see Arith4.hs