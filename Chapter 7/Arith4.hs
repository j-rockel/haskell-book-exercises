-- arith4.hs
module Arith4 where
-- id :: a -> a
-- id x = x
roundTrip :: (Show a, Read a) => a -> a
roundTrip a = read (show a)

main = do
    print (roundTrip 4)
    print (id 4)

roundTripPointfree :: (Show a, Read a) => a -> a
roundTripPointfree = read . show

roundTripDiffType :: (Show a, Read b) => a -> b
roundTripDiffType = read . show
