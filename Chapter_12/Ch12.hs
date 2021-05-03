-- String processing

-- example GHCi session
-- above the functions
-- >>> notThe "the"
-- Nothing
-- >>> notThe "blahtheblah"
-- Just "blahtheblah"
-- >>> notThe "woot"
-- Just "woot"
notThe :: String -> Maybe String
notThe s | s == "the" = Nothing
notThe s | otherwise = Just s

-- >>> replaceThe "the cow loves us"
-- "a cow loves us"
replaceThe :: String -> String
replaceThe = unwords . map replaceIndividualWord . words

replaceIndividualWord :: String -> String
replaceIndividualWord s = case notThe s of 
    Nothing -> "a"
    Just s -> s

-- >>> countTheBeforeVowel "the cow"
-- 0
-- >>> countTheBeforeVowel "the evil cow"
-- 1
countTheBeforeVowel :: String -> Int
countTheBeforeVowel s = go (words s) 0 where
    go :: [String] -> Int -> Int
    go [] n = n
    go (x:xs) n | (x == "the") || (x == "The") = go (tail xs) n' where 
        n' = if isVowel $ head (head xs) then n + 1 else n 
    go (x:xs) n | otherwise = go xs n

isVowel :: Char -> Bool
isVowel x = x `elem` "aeiouAEIOU" 

-- >>> countVowels "the cow"
-- 2
-- >>> countVowels "Mikolajczak"
-- 4
countVowels :: String -> Int
countVowels = length . filter isVowel


-- Validate the word

newtype Word' =
    Word' String
    deriving (Eq, Show)

vowels = "aeiou"

mkWord :: String -> Maybe Word'
mkWord s | countVowels s > countConsonants s = Nothing
mkWord s | otherwise = Just (Word' s)

countConsonants :: String -> Int
countConsonants = length . filter (not . isVowel)

-- It's only Natural
data Nat = Zero
         | Succ Nat
            deriving (Eq, Show) 

-- >>> natToInteger Zero
-- 0
-- >>> natToInteger (Succ Zero)
-- 1
-- >>> natToInteger (Succ (Succ Zero))
-- 2
natToInteger :: Nat -> Integer
natToInteger Zero = 0
natToInteger (Succ n) = (natToInteger n) + 1

-- >>> integerToNat 0
-- Just Zero
-- >>> integerToNat 1
-- Just (Succ Zero)
-- >>> integerToNat 2
-- Just (Succ (Succ Zero))
-- >>> integerToNat (-1)
-- Nothing
integerToNat :: Integer -> Maybe Nat
integerToNat i | i < 0  = Nothing
integerToNat i | i == 0 = Just Zero
integerToNat i | i > 0  = integerToNat (i-1) >>= Just . Succ