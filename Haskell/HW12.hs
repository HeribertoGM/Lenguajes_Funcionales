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
import Data.List

-- === distance ===
distance :: (Double, Double) -> (Double, Double) -> Double
distance p1 p2  = sqrt (((fst p1 - fst p2) ** 2) + ((snd p1 - snd p2) ** 2))

-- === shift ===

shift :: [t] -> Int -> [t]
shift [] _ = []
shift lst i
    | abs i > length lst = shift lst ((mod i (length lst))+1)
    | i > 0 = genericDrop (abs i-1) lst ++ genericTake (abs i-1) lst
    | i < 0 = genericDrop (abs i) lst ++ genericTake (abs i) lst
    | i == 0 = lst

-- === myFilter ===

-- Please note that this function takes two arguments.
-- The first one is a function of type (t -> Bool)
-- The second one is a list of a generic type, t.
myFilter :: (t -> Bool) -> [t] -> [t]
myFilter _ [] = []
myFilter f (h:t) = if (f h) then h:(myFilter f t) else (myFilter f t)

-- === crossover ===

genOffspring :: [Char] -> [Char] -> Int -> [Char]
genOffspring _ [] _ = []
genOffspring (h1:t1) (h2:t2) i
    | i > 0 = h1: (genOffspring t1 t2 (i-1))
    | otherwise = h2 : (genOffspring t1 t2 i)


crossover :: [Char] -> [Char] -> Int -> ([Char], [Char])
crossover p1 p2 i = (genOffspring p1 p2 i, genOffspring p2 p1 i)

-- === xSort ===

xSort :: [(String, Int, Int)] -> [(String, Int, Int)]
xSort [] = []
xSort ((ie, ip, ig):t) = let 
    left = filter (\(_,cp,cg) -> (cp > ip) || ((cp == ip) && (cg > ig))) t
    right = filter (\(_,cp,cg) -> (cp < ip) || ((cp == ip) && (cg < ig))) t
    in
    (xSort left)++[(ie,ip,ig)]++(xSort right)

-- === treeSum ===

data Tree = Tree Int Tree Tree | E deriving Show

treeSum :: Tree -> Int
treeSum E = 0
treeSum (Tree x t1 t2) = (treeSum t1) + x + (treeSum t2)

-- === Test cases ===

main = do
    print "=== distance ==="
    print $ distance (10, 20) (5, 15) -- 7.0710678118654755
    print "=== shift ==="
    print $ shift [3, 5, 1, 4, 2] 3 -- [1,4,2,3,5]
    print $ shift [3, 5, 1, 4, 2] (-3) -- [4,2,3,5,1]
    print $ shift "helloworld" 75 -- "worldhello"
    print "=== myFilter ==="
    print $ myFilter (> 3) [1, 2, 3, 4, 5, 6, 7] -- [4,5,6,7]
    print $ myFilter (\x -> x * 2 < 5) [1, 2, 3, 4, 5, 6, 7] -- [1,2]
    print "=== crossover ==="
    print $ crossover "aaaaa" "bbbbb" 3 -- ("aaabb","bbbaa")
    print $ crossover "aaaaa" "bbbbb" 1 -- ("abbbb","baaaa")
    print $ crossover "aaaaa" "bbbbb" 4 -- ("aaaab","bbbba")
    print "=== qSort ==="
    print $ xSort [("Pumas", 10, 3), ("America", 10, 5), ("Chivas", 11, 8), ("Cruz Azul", 11, 2), ("Tigres", 9, 4), ("Rayados", 9, 6)] -- [("Chivas",11,8),("Cruz Azul",11,2),("America",10,5),("Pumas",10,3),("Rayados",9,6),("Tigres",9,4)]
    print "=== treeSum ==="
    print $ treeSum (Tree 8 (Tree 5 (Tree 2 E E) (Tree 7 E E)) (Tree 9 E E))