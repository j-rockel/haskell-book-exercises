-- Chapter 2 Exercises 
-- (postfix _s for solution)

import qualified Data.Typeable as T 

-- Parenthesization 

p1      = 2 + 2 * 3 - 1
p1_s    = 2 + (2 * 3) - 1

p2      = (^) 10 $ 1 + 1
p2_s    = 10 ^ (1 + 1)

p3      = 2 ^ 2 * 4 ^ 5 + 1
p3_s    = ((2 ^2) * (4 ^ 5)) + 1

checkParenthesization :: IO()
checkParenthesization = do 
    check "1: " p1 p1_s 
    check "2: " p2 p2_s 
    check "3: " p3 p3_s 
    return () 


check :: Eq a => String -> a -> a -> IO() 
check q a b = print (q ++ show (a == b))

-- Equivalent Expressions

checkEquivalence :: IO()
checkEquivalence = do 
    check "1: " (1 + 1) (2)
    check "2: " (10 ^2) ( 10 + 9 * 10)
    check "3: " (400 - 37) ((-) 37 400)
    check "4: " (fromIntegral (100 `div` 3)) (100 / 3)
    check "5: " (2 * 5 + 18) (2 * (5 + 18))
    return ()

-- More fun with functions

waxOn = x * 5 where
    z = 7 
    x = y ^ 2 
    y = z + 8

triple x = x * 3

waxOff x = triple x