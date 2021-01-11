awesome = ["Papuchon", "curry", ":)"]
also = ["Quake", "The Simons"]
allAwesome = [awesome, also]

-- 8. 
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x = x == reverse x

-- 9.
myAbs :: Integer -> Integer
myAbs x = if x < 0 then - x else x

-- 10. 

fp :: (a,b) -> (c, d) -> ((b, d), (a, c))
fp x y = ((snd x, snd y), (fst x, fst y)) 

-- Correcting Syntax 
{- 1. 

x = (+)

F xs = w 'x' 1 
    where w = length xs 
-}

x = (+)

f1 xs = w `x` 1 where 
    w = length xs

{- 2.
\X -> x
-}

f2 = (\x -> x)

{- 3. 
f (a b) = A
-}

f3 (a, b) = a 