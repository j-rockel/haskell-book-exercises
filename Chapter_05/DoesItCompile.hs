module DoesItCompile where 
-- Does it compile? 

{- 1. 
bigNum = (^) 5 $ 10
wahoo = bigNum $ 10
-}

bigNum = (^) 5 $ 10
wahoo = bigNum ^ 10

{- 2. 
x = print
y = print "woohoo!"
z = x "hello world"
-}

a = print
b = print "woohoo!"
c = a "hello world"

{- 3. 
a = (+)
b = 5
c = b 10
d = c 200 
-}

a' = (+)
b' = 5
c' = a' b' 10
d' = a' c' 200

{- 4. 
a = 12 + b
b = 10000 * c
-}

a'' = 12 + b''
b'' = 10000 * c''
c'' = 1
