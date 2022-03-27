module Addition where

import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec $ do
    describe "Addition" $ do
        it "1 + 1 is greater than 1" $ do 
            (1 + 1) > 1 `shouldBe` True
        it "2 + 2 is equal to 4" $ do 
            2 + 2 `shouldBe` 4
        it "15 divided by 3 is 5" $ do
            dividedBy 15 3 `shouldBe` (5, 0)
        it "22 divided by 5 is\
            \ 4 remainder 2" $ do
            dividedBy 22 5 `shouldBe` (4, 2)
        it "mult 2 2 is 2 * 2" $ do
            2 `mult` 2 `shouldBe` 2*2
        it "mult 0 0 is 0" $ do
            0 `mult` 0 `shouldBe` 0
        it "x + 1 is always\
            \ greater than x" $ do
            property $ \x -> x + 1 > (x :: Int)

dividedBy :: Integral a => a -> a -> (a, a)
dividedBy num denom = go num denom 0
    where go n d count
                | n < d = (count, n)
                | otherwise = go (n - d) d (count + 1)

-- multiplication by recursive summation from Chapter 8
mult :: (Integral a) => a -> a -> a
mult x y = go x y 0 where 
    go _ 0 _ = 0
    go 0 _ res = res
    go n y' res = go (n-1) y' (res + y')

-- some generators

oneThroughThree :: Gen Int
oneThroughThree = elements [1, 2, 2, 2, 2, 3]

genBool :: Gen Bool
genBool = choose (False, True)

genBool' :: Gen Bool
genBool' = elements [False, True]

genOrdering :: Gen Ordering
genOrdering = elements [LT, EQ, GT]

genChar :: Gen Char
genChar = elements ['a'..'z']

genTuple :: (Arbitrary a, Arbitrary b) => Gen (a, b)
genTuple = do
    a <- arbitrary
    b <- arbitrary
    return (a, b)

genThreeple :: (Arbitrary a, Arbitrary b, Arbitrary c) => Gen (a, b, c)
genThreeple = do
    a <- arbitrary
    b <- arbitrary
    c <- arbitrary
    return (a, b, c)

genEither :: (Arbitrary a, Arbitrary b) => Gen (Either a b)
genEither = do
    a <- arbitrary
    b <- arbitrary
    elements [Left a, Right b]

-- equal probability
genMaybe :: Arbitrary a => Gen (Maybe a)
genMaybe = do
    a <- arbitrary
    elements [Nothing, Just a]

-- What QuickCheck does so
-- you get more Just values
genMaybe' :: Arbitrary a => Gen (Maybe a)
genMaybe' = do
    a <- arbitrary
    frequency   [ (1, return Nothing)
                , (3, return (Just a))]

-- more QuickCheck

prop_additionGreater :: Int -> Bool
prop_additionGreater x = x + 1 > x

runQc :: IO ()
runQc = quickCheck prop_additionGreater