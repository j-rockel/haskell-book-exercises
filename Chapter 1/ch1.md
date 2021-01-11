## Chapter 1

# Equivalence Exercises 

1 - b
2 - c
3 - b

# Combinators

1 - yes 
2 - no, z is free
3 - yes 
4 - yes 
5 - no, z is free

# Normal form or diverge? 

1 - is in normal form 
2 - diverges, this is equivalent to the omega term
3 - has a normal form: (z z z)

# Beta Reduce 

1: (\a b c -> c b a) z z (\w v -> w) --> (\b c -> c b z) z (\w v -> w) --> (\c -> c z z) (\w v -> w) --> (\w v -> w) z z --> (\v -> z) z --> z

2: (\x -> (\y -> x y y)) (\a -> a) b --> (\y -> (\a -> a) y y) b --> (\a -> a) b b -> b b

3: (\y -> y) (\x -> x x) (\z -> z q) --> (\x -> x x) (\z -> z q) --> (\z -> z q) (\z -> z q) --> (\z -> z q) q --> q q

4: (\z -> z) (\z -> z z) (\z -> z y) --> (\z -> z z) (\z -> z y) --> (\z -> z y) (\z -> z y) --> (\z -> z y) y --> y y

5: (\x -> (\y -> x y y)) (\y -> y) y --> (\x -> (\a -> x a a)) (\b -> b) y --> (\a -> (\b -> b) a a) y --> (\b -> b) y y -> y y

6: (\a -> a a) (\b -> b a) c --> (\b -> b a) (\b -> b a) c --> (\b -> b a) a c --> a a c

7: (\x y z -> x z (y z)) (\x -> z) (\x -> a) --> (\f g h -> f h (g h)) (\x -> z) (\x -> a) --> (\g h -> (\x -> z) h (g h)) (\x -> a) --> (\h -> (\x -> z) h ((\x -> a) h)) --> (\h -> z ((\x -> a) h)) --> (\h -> z a)