module Cipher where

-- Copied from chapter 9's Caesar cipher 
import Data.Char

shift :: Int -> Int -> Int
shift n x | 65 <= x && x < 91 = 65 + (x + n - 65) `mod` 26 
shift n x | 97 <= x && x < 123 = 97 + (x + n - 97) `mod` 26 
shift n x | otherwise = error "not a letter"

caesar :: Int -> String -> String
caesar n = map (chr . (shift (n `mod` 26)) . ord)  

unCaesar :: Int -> String -> String
unCaesar n = map (chr . (shift (26 - (n `mod` 26))) . ord)

-- new 
shiftChar :: Int -> Char -> Char
shiftChar n = chr . (shift (n `mod` 26)) . ord

shiftCharBack :: Int -> Char -> Char
shiftCharBack n = chr . (shift (26 - (n `mod` 26))) . ord

cipherWord :: [Int] -> String -> String
cipherWord keys = zipWith shiftChar keys

decipherWord :: [Int] -> String -> String
decipherWord keys = zipWith shiftCharBack keys

makeKeySequence :: String -> [Int]
makeKeySequence keyword = cycle $ map ((\x -> x - 97) . ord) (map toLower keyword) 

getKeys :: [Int] -> [String] -> [[Int]] -> [[Int]]
getKeys src [] ks = reverse ks
getKeys src (x:xs) ks = 
    let (nextKey, rem) = splitAt (length x) src in 
    getKeys rem xs (nextKey:ks)

vigenere :: String -> String -> String
vigenere keyword text = let
    splitText = words text 
    keys = getKeys (makeKeySequence keyword) splitText [] in 
        unwords $ zipWith cipherWord keys splitText

unVigenere :: String -> String -> String
unVigenere keyword ciphertext = let
    splitText = words ciphertext 
    keys = getKeys (makeKeySequence keyword) splitText [] in 
        unwords $ zipWith decipherWord keys splitText