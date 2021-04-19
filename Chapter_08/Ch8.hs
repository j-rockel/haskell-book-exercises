-- Reviewing currying
cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y

flippy :: String -> String -> String
flippy = flip cattyConny

appedCatty :: String -> String
appedCatty = cattyConny "woops"

frappe :: String -> String
frappe = flippy "haha"

-- Recursion 
-- 2: 
sumTo :: (Eq a, Num a) => a -> a
sumTo x = go x 0 where
    go 0 currSum = currSum 
    go n currSum = go (n-1) (currSum + n)

-- 3:
mult :: (Integral a) => a -> a -> a
mult x y = go x y 0 where 
    go _ 0 res = 0
    go 0 _ res = res
    go n y res = go (n-1) y (res + y)

-- Fixing dividedBy 
oldDividedBy :: Integral a => a -> a -> a
oldDividedBy num denom = fst $ go num denom 0
    where go n d count
            | n < d = (count, n)
            | otherwise =
                go (n - d) d (count + 1)

pos :: (Integral a) => a -> Bool
pos x | x >= 0  = True
pos x | x < 0   = False

dividedBy :: Integral a => a -> a -> Maybe a
dividedBy _ 0 = Nothing 
dividedBy n d | pos n == pos d = Just $ oldDividedBy (abs n) (abs d)
dividedBy n d | pos n /= pos d = Just $ - (oldDividedBy (abs n) (abs d)) where 
    abs x | pos x = x
    abs x | not (pos x) = - x

-- McCarthy 91 function
mc91 :: (Ord b, Num b) => b -> b
mc91 n | n > 100 = n - 10
mc91 n | n <= 100 = mc91 . mc91 $ n + 11 