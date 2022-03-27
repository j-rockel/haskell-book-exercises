{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeApplications #-}
module QuickCheckTest where

import Test.QuickCheck
import QuickCheck
import Data.List (sort)

main = 
    quickCheck prop_halfIdentity >>
    quickCheck (prop_listOrdered @Int) >>
    quickCheck (prop_listOrdered @Bool) >>
    quickCheck (prop_listOrdered @String)>>
    quickCheck (prop_plusAssociative @Int)>>
    quickCheck (prop_plusAssociative @Integer) >>
    quickCheck (prop_plusCommutative @Int)>>
    quickCheck (prop_plusCommutative @Integer) >>
    quickCheck (prop_multAssociative @Int)>>
    quickCheck (prop_multAssociative @Integer) >>
    quickCheck (prop_multCommutative @Int)>>
    quickCheck (prop_multCommutative @Integer) >>
    quickCheck (prop_quotRem @Int)>>
    quickCheck (prop_quotRem @Integer) >>
    quickCheck (prop_divMod @Int)>>
    quickCheck (prop_divMod @Integer)

-- 1
prop_halfIdentity :: Float -> Bool
prop_halfIdentity x = ((*2) . half $ x) == x

-- 2
prop_listOrdered :: (Ord a) => [a] -> Bool 
prop_listOrdered xs = 
    snd $ foldr go (Nothing, True) (sort xs)
    where 
        go _ status@(_, False) = status
        go y (Nothing, t) = (Just y, t)
        go y (Just x, t) = (Just y, x >= y)

-- 3 
prop_plusAssociative :: (Eq a, Num a) => a -> a -> a -> Bool
prop_plusAssociative x y z =
    x + (y + z) == (x + y) + z

prop_plusCommutative :: (Eq a, Num a) => a -> a -> Bool
prop_plusCommutative x y =
    x + y == y + x

-- 4
prop_multAssociative :: (Eq a, Num a) => a -> a -> a -> Bool
prop_multAssociative x y z =
    x * (y * z) == (x * y) * z

prop_multCommutative :: (Eq a, Num a) => a -> a -> Bool
prop_multCommutative x y =
    x * y == y * x

-- 5
prop_quotRem :: (Integral a) => NonZero a -> NonZero a -> Bool
prop_quotRem (NonZero x) (NonZero y) = (quot x y)*y + (rem x y) == x

prop_divMod :: (Integral a) => NonZero a -> NonZero a -> Bool
prop_divMod (NonZero x) (NonZero y) = (div x y)*y + (mod x y) == x