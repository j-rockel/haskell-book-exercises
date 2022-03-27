module Main where
import Test.Hspec (hspec)
import qualified WordNumberTest
import qualified QuickCheckTest

main :: IO ()
main = WordNumberTest.main >> QuickCheckTest.main
