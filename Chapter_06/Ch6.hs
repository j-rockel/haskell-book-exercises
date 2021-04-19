-- Type-Kwon-Do

-- 1:
chk :: Eq b => (a -> b) -> a -> b -> Bool
chk f a b = f a == b

-- 2:
arith :: Num b
  => (a -> b)
  -> Integer
  -> a
  -> b
arith f i a = (f a) -- including i in any way leads to compile errors bc type is more specific than that of b