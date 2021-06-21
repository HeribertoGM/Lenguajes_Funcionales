-- ====================
-- Complete the following functions and submit your file to Canvas.
-- ====================
-- Do not change the names of the functions. 
-- Do not change the number of arguments in the functions.
-- If your file cannot be loaded by the Haskell compiler, your submission may be cancelled. 
-- Then, submit only code that works.
-- ====================
-- Grading instructions:
-- There is a series of test cases for each function. In order to state that your function
-- "works as described", your output must be similar to the expected one in each case.

-- === index ===

index :: [Char] -> Char -> Int
index [] _ = error "Character cannot be found\n"
index (h:t) c = if h == c then 0 else 1 + index t c

-- === first ===

firstn :: [t] -> Int -> [t]
firstn [] i = []
firstn (h:t) i = if i == 0 then [] else h:firstn t (i-1) 

-- === last ===

lastn :: [t] -> Int -> [t]
lastn [] i = []
lastn (h:t) i = if length t < i then h:lastn t i else lastn t i

-- === Test cases ===

main = do 
    print "=== index ==="
    print $ index "abcdefgh" 'a' -- 0
    print $ index "abcdefgh" 'e' -- 4
    print "=== firstn ==="
    print $ firstn "abcdefgh" 3 -- "abc"
    print $ firstn [1.1, 2.2, 3.3, 4.4, 5.5] 2 -- [1.1,2.2]
    print $ firstn [10, 20, 30, 40, 50] 6 -- [10,20,30,40,50]
    print "=== lastn ==="
    print $ lastn "abcdefgh" 3 -- "fgh"
    print $ lastn  [1.1, 2.2, 3.3, 4.4, 5.5] 2 -- [4.4,5.5]
    print $ lastn  [10, 20, 30, 40, 50] 6 -- [10,20,30,40,50]   