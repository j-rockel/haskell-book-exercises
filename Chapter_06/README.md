# Chapter 6: Typeclasses

### Multiple choice: 
1 -> c

2 -> b 

3 -> a 

4 -> a

5 -> a 

### Does it typecheck? 
1: no, because Person doesn't have a Show instance

2: no, because Mood doesn't have an Eq instance

3: (assuming settleDown is fixed by adding deriving Eq to Mood) a) input must be a Mood b) no instance for Num Mood c) no instance Ord for Mood

4: yes (but s1 is not a sentence, its a function `s1 :: Object -> Sentence`)

### Given a datatype declaration, what can we do?
1: won't typecheck bc the type constructors for Rocks & Yeah are missing

2: will typecheck

3: will typecheck

4: won't typecheck bc Papu doesn't have an Ord instance

### Match the types
1: doesn't work, the Num restriction is necessary

2: doesn't work, needs Fractional

3: works

4: works

5: works (since its more restrictive than necessary)

6: works (since its more restrictive than necessary)

7: won't work since myX has Type Int which is more restrictive than a

8: won't work since myX has Type Int which is more restrictive than a

9: works

10: also works since sort & head are generic enough anyways

11: doesn't work bc mySort is specific to Char

### Type-Kwon-Do Two: Electric Typealoo
see Ch6.hs