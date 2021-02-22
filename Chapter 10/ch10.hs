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