-- Small library for Either

-- 1.
lefts' :: [Either a b] -> [a]
lefts' = foldr addLeft [] where
    addLeft (Left x) xs  = x:xs
    addLeft (Right _) xs = xs

-- 2. 
rights' :: [Either a b] -> [b]
rights' = foldr addRight [] where
    addRight (Left _) xs  = xs
    addRight (Right x) xs = x:xs

-- 3.
partitionEithers' :: [Either a b] -> ([a], [b])
partitionEithers' xs = (lefts' xs, rights' xs)

-- 4.
eitherMaybe' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe' _ (Left _) = Nothing
eitherMaybe' f (Right x) = Just $ f x

-- 5.
either' :: (a -> c) -> (b -> c) -> Either a b -> c
either' f _ (Left a) = f a
either' _ g (Right b) = g b

-- 6. 
eitherMaybe'' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe'' f = either' (\x -> Nothing) (Just . f)