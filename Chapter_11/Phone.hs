module Phone where
-- Phone Exercise

import Data.List
import Data.Char

-- 1. 
data DaPhone = DaPhone [(Digit, String)]

thisPhone :: DaPhone
thisPhone = DaPhone
            [ ('1', "1") 
            , ('2', "abc2")
            , ('3', "def3")
            , ('4', "ghi4")
            , ('5', "jkl5")
            , ('6', "mno6")
            , ('7', "pqrs7")
            , ('8', "tuv8")
            , ('9', "wxyz9")
            , ('*', "^*")
            , ('0', "+ 0")
            , ('#', ".,#") ]

-- 2. 
convo :: [String]
convo =
    ["Wanna play 20 questions",
    "Ya",
    "U 1st haha",
    "Lol ok. Have u ever tasted alcohol",
    "Lol ya",
    "Wow ur cool haha. Ur turn",
    "Ok. Do u think I am pretty Lol",
    "Lol ya",
    "Just making sure rofl ur turn"]

-- validButtons = "1234567890*#"
type Digit = Char

-- Valid presses: 1 and up
type Presses = Int

reverseTaps :: DaPhone -> Char -> [(Digit, Presses)]
reverseTaps p c = go p c [] where 
    go :: DaPhone -> Char -> [(Digit, Presses)] -> [(Digit, Presses)]
    go p c xs | isUpper c = go p (toLower c) [('*', 1)]
    go p c xs | otherwise = case getMaybeTapsForNonUpper p c of
        Just x -> xs ++ [x]
        Nothing -> error "oopsie" 
        
getMaybeTapsForNonUpper :: DaPhone -> Char -> Maybe (Digit, Presses)
getMaybeTapsForNonUpper (DaPhone buttonList) c = do 
    (digit, chars) <- find (buttonWrites c) buttonList
    presses <- (elemIndex c chars)
    return (digit, presses + 1)

buttonWrites :: Char -> (Digit, String) -> Bool
buttonWrites c (_, cs) = c `elem` cs

tapSentence :: DaPhone -> String -> [(Digit, Presses)]
tapSentence p s = concat $ map (reverseTaps p) s

tappedConvo :: [[(Digit, Presses)]]
tappedConvo = map (tapSentence thisPhone) convo

-- 3.
fingerTaps :: [(Digit, Presses)] -> Presses
fingerTaps = foldr (\(a,b) c -> b + c) 0

-- 4.
mostPopularLetter :: String -> Char
mostPopularLetter = snd . last . sortByPopularity

sortByPopularity :: (Eq a, Ord a) => [a] -> [(Int, a)]
sortByPopularity = sortBy compare . map (\xs -> (length xs, head xs)) . group . sortBy compare

-- 5.
coolestLtr :: [String] -> Char
coolestLtr = mostPopularLetter . concat

coolestWord :: [String] -> String
coolestWord = snd . last . sortByPopularity . concat . map words