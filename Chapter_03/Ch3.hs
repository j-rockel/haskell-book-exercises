-- Chapter 3

-- Building functions 

-- 2.
-- a)
exclamation :: String -> String
exclamation s = s ++ "!"

-- b)
pos5 :: String -> String 
pos5 s = [s !! 5] 

-- c) 
drop9 :: String -> String 
drop9 = drop 9

-- 3. 
thirdLetter :: String -> Char
thirdLetter s = s !! 3

-- 4. 
letterIndex :: String -> Int -> Char 
letterIndex s i = s !! (i - 1)

-- 5. 
rvrs :: String -> String
rvrs s = drop 9 s ++ drop 5 (take 9 s) ++ take 5 s

-- 6. 
main :: IO()
main = print $ rvrs "Curry is awesome"