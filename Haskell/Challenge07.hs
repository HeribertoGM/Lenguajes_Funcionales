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

import qualified Data.List as List (genericTake, genericDrop)

-- === degree ===

data Graph = Graph [String] deriving Show

degree :: Graph -> [Int]
degree (Graph []) = []
degree (Graph lst) = map (\curr -> (length curr) - 1) lst

-- === mode ===

mode :: [Int] -> (Int, Int)
mode [] = error "Not implemented for empty list\n"
mode [x] = (x, 1)
mode (h:t) = let
    x = (h,  length (filter (\curr -> curr==h) (h:t)))
    y = mode t
    in
    if (snd x >= snd y) then x else y

-- === set ===

data Set = Set [Int] deriving Show

unique :: [Int] -> [Int]
unique [] = []
unique (h:t) = h: unique (filter (\x -> x /= h) t)

set :: [Int] -> Set
set lst = (Set (unique lst))

-- === union ===

union :: Set -> Set -> Set
union (Set x) (Set y) = (set (x++y))

-- === intersect ===

intersection :: Set -> Set -> Set
intersection (Set x) (Set y) = set ([zi | zi <- x, elem zi y])

-- === mSort ===

merge :: [Int] -> [Int] -> [Int]
merge [] [] = []
merge [] lst = lst
merge lst [] = lst
merge (h1:t1) (h2:t2) = if h1 < h2
    then h1: (merge t1 (h2:t2))
    else h2: (merge (h1:t1) t2)

mSort :: [Int] -> [Int]
mSort lst
    | (length lst) <= 1 = lst
    | otherwise = let
        left = (mSort (List.genericTake (div (length lst) 2) lst))
        right = (mSort (List.genericDrop (div (length lst) 2) lst))
        in
        (merge left right)

-- === Test cases ===

main = do
    print "=== degree ==="
    print $ degree (Graph ["abcd", "bdf", "caef", "de", "eab", "f"]) -- [3,2,3,1,2,0]
    print $ degree (Graph ["adf", "bacdef", "cbe", "daf", "eabcd", "fb"]) -- [2,5,2,2,4,1]
    print "=== mode ==="
    print $ mode [1, 2, 3, 4, 3, 2, 1, 2, 3, 4, 5, 1, 1, 2] -- (1,4)
    print $ mode [10, 20, 30, 30, 30, 20, 20, 10, 30, 20, 20, 10, 30] -- (20,5)
    print "=== set ==="
    print $ set [1, 2, 3, 2, 4, 1, 2, 5, 2, 3] -- Set [1,2,3,4,5]
    print $ set [3, 4, 3] -- Set [3,4]
    print $ set [10, 3, 4, 8, 3, 11] -- Set [10,3,4,8,11]
    print "=== union ==="
    print $ union (Set [1, 2, 3, 4]) (Set [3, 4, 5, 6]) -- Set [1,2,3,4,5,6]
    print $ union (Set [10, 2, 8, 4]) (Set []) -- Set [10,2,8,4]
    print $ union (Set [2, 8, 4]) (Set [2, 5, 6]) -- Set [2,8,4,5,6]
    print "=== intersection ==="
    print $ intersection (Set [1, 2, 3, 4]) (Set [3, 4, 5, 6]) -- Set [3,4]
    print $ intersection (Set [10, 2, 8, 4]) (Set []) -- Set []
    print $ intersection (Set [2, 8, 4]) (Set [8]) -- Set [8]
    print "=== msort ==="
    print $ mSort [2, -3, 6, 10, -6, 8] -- [-6,-3,2,6,8,10]