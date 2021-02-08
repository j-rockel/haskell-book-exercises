module Cipher where

import Data.Char

shift :: Int -> Int -> Int
shift n x | 65 <= x && x < 91 = 65 + (x + n - 65) `mod` 26 
shift n x | 97 <= x && x < 123 = 97 + (x + n - 97) `mod` 26 

caesar :: Int -> String -> String
caesar n = map (chr . (shift (n `mod` 26)) . ord)  

unCaesar :: Int -> String -> String
unCaesar n = map (chr . (shift (26 - (n `mod` 26))) . ord)