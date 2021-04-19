{-# LANGUAGE NoMonomorphismRestriction #-}

module DetermineTheType where
-- simple example
example = 1

-- 1.
oneA :: Num a => a
oneA = (* 9) 6
oneB :: Num a => (a, [Char])
oneB = head [(0,"doge"),(1,"kitteh")]
oneC :: (Integer, [Char])
oneC = head [(0 :: Integer ,"doge"),(1,"kitteh")]
oneD :: Bool
oneD = if False then True else False
oneE :: Int
oneE = length [1, 2, 3, 4, 5]
oneF :: Bool
oneF = (length [1, 2, 3, 4]) > (length "TACOCAT")

-- 2.
x :: Num a => a
x = 5
y :: Num a => a
y = x + 5
w :: Num a => a
w = y * 10

-- 3.
x' :: Num a => a
x' = 5
y' :: Num a => a
y' = x' + 5
z :: Num a => a -> a
z y' = y' * 10

-- 4. 
x'' :: Num p => p
x'' = 5
y'' :: Num a => a
y'' = x'' + 5
f :: Fractional a => a
f = 4 / y''

-- 5.
x''' :: [Char]
x''' = "Julie"
y''' :: [Char]
y''' = " <3 "
z''' :: [Char]
z''' = "Haskell"
f''' :: [Char]
f''' = x''' ++ y''' ++ z'''
