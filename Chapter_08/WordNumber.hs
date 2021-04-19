module WordNumber where

import Data.List (intersperse)

digitToWord :: Int -> String
digitToWord n | n < 10 = words !! n where 
    words = [
        "zero", 
        "one", 
        "two", 
        "three", 
        "four", 
        "five",
        "six",
        "seven",
        "eight",
        "nine"]

digits :: Int -> [Int]
digits n = go n [] where 
    go 0 ds = ds
    go n ds = go (n `div` 10) ((n `mod` 10):ds)

wordNumber :: Int -> String
wordNumber n = concat $ intersperse "-" digitWordList where 
    digitWordList = fmap digitToWord $ digits n