
import Data.Char

-- As-patterns
isSubseqOf :: (Eq a) => [a] -> [a] -> Bool
isSubseqOf [] _                 = True
isSubseqOf (x:xs) []            = False
isSubseqOf seq@(x:xs) (y:ys)    = if x == y then isSubseqOf xs ys else isSubseqOf seq ys

capitalizeWords :: String -> [(String, String)]
capitalizeWords = (map makeTuple) . words where
    makeTuple :: String -> (String, String)
    makeTuple s@(x:xs)  = (s, (toUpper x):xs)

-- Language Exercises
capitalizeWord :: String -> String
capitalizeWord [] = []
capitalizeWord (x:xs) = (toUpper x):xs

capitalizeParagraph :: String -> String
capitalizeParagraph = unwords . (capitalizeSentences True) . words where
    capitalizeSentences :: Bool -> [String] -> [String]
    capitalizeSentences _ [] = []
    capitalizeSentences True (x:xs) = (capitalizeWord x):(capitalizeSentences (last x == '.') xs)
    capitalizeSentences False (x:xs) = x:(capitalizeSentences (last x == '.') xs)

-- Hutton's Razor
data Expr = Lit Integer | Add Expr Expr

eval :: Expr -> Integer
eval (Lit x) = x
eval (Add a b) = (eval a) + (eval b)

printExpr :: Expr -> String
printExpr (Lit x) = show x
printExpr (Add a b) = (printExpr a) ++ " + " ++ (printExpr b)