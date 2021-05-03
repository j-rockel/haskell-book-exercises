-- Unfolds

-- Write your own iterate and unfoldr

-- 1.
myIterate :: (a -> a) -> a -> [a]
myIterate f x =  x : myIterate f (f x)

-- 2.
myUnfoldr :: (b -> Maybe (a, b)) -> b -> [a]
myUnfoldr f x = case f x of 
    Nothing -> []
    Just (a, b) -> a : (myUnfoldr f b)

-- 3.
-- It helps to have the
-- types in front of you
-- myUnfoldr :: (b -> Maybe (a, b))
-- -> b
-- -> [a]
betterIterate :: (a -> a) -> a -> [a]
betterIterate f x = myUnfoldr (\a -> Just (a, f a)) x

-- Finally something other than a list!
data BinaryTree a = Leaf
                  | Node (BinaryTree a) a (BinaryTree a)
    deriving (Eq, Ord, Show)

-- 1.
unfold :: (a -> Maybe (a,b,a)) -> a -> BinaryTree b
unfold f x = case f x of
    Nothing -> Leaf
    Just (l, n, r) -> Node (unfold f l) n (unfold f r)

-- 2. 
treeBuild :: Integer -> BinaryTree Integer
treeBuild n = unfold (countDown n) n where 
    countDown n x | x <= 0 = Nothing
    countDown n x | x > 0  = Just (x-1, n-x, x-1)