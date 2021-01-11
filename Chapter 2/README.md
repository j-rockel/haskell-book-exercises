# Chapter 2

### Parenthesization
see ch2.hs

### Equivalent expressions
1 - yes 

2 - yes 

3 - no, order of arguments is switched & is important for the evaluation of subtraction 

4 - no, because the return type is different 

5 - no, because of operator precedence ( * before + )

(verification see ch2.hs)

### More fun with functions

for use in ghci: 
waxOn = let z = 7; x = y ^ 2; y = z + 8 in x * 5

waxOn -> 1125, 
10 + waxOn -> 1135, 
(+10) waxOn -> 1135,
(-) 15 waxOn -> -1110,
(-) waxOn 15 -> 1110

see ch2.hs for the rest