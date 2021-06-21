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

-- === Distance between two points ===

data Point = Point Double Double deriving Show

distance :: Point -> Point -> Double
distance (Point x1 y1) (Point x2 y2) = 
     sqrt ((x1 - x2) ** 2 + (y1 - y2) ** 2)

-- === Complex numbers ===

data Complex = Complex Int Int deriving Show

add :: Complex -> Complex -> Complex
add (Complex a1 b1) (Complex a2 b2) = 
    Complex (a1+a2) (b1+b2)

multiply :: Complex -> Int -> Complex
multiply (Complex a b) c = Complex (a*c) b

getReal :: Complex -> Int
getReal (Complex a _) = a

getImaginary :: Complex -> Int
getImaginary (Complex _ b) = b

-- === The RGB color mode ===

-- Yes, the components are given as a tuple inside the data type...
data RGB = RGB (Int, Int, Int) deriving Show

getR :: RGB -> Int
getR (RGB (r, _, _)) = r

getG :: RGB -> Int
getG (RGB (_, g, _)) = g

getB :: RGB -> Int
getB (RGB (_, _, b)) = b

getMaxComponent :: RGB -> ([Char], Int)
getMaxComponent (RGB (r, g, b))
    | (r > g && r > b) = ("Red", r)
    | (g > r && g > b) = ("Green", g)
    | (b > r && b > g) = ("Blue", b)

combine :: RGB -> RGB -> RGB
combine (RGB (r1, g1, b1)) (RGB (r2, g2, b2)) = 
    let avg = \x y -> (div (x+y) 2) in
    RGB (avg r1 r2, avg g1 g2, avg b1 b2)

-- === Playing cards ===

data Suit = Diamonds | Clubs | Hearts | Spades deriving Show
data Color = Red | Black deriving Show
data Rank = Jack | Queen | King | Ace | Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten deriving Show
data Card = Card Rank Suit deriving Show

getValue :: Card -> Int
getValue (Card rank _) = case rank of
    Two -> 2
    Three -> 3
    Four -> 4
    Five -> 5
    Six -> 6
    Seven -> 7
    Eight -> 8
    Nine -> 9
    Ten -> 10
    Jack -> 11
    Queen -> 12
    King -> 13
    Ace -> 14

getColor :: Card -> Color
getColor (Card _ suit) = case suit of
    Diamonds -> Red
    Clubs -> Black
    Hearts -> Red
    Spades -> Black

-- === Test cases ===

main = do 
    print "=== Distance between two points ==="
    print "=== distance ==="
    print $ distance (Point 10 20) (Point 5 15) -- 7.0710678118654755
    print "=== Complex numbers ==="
    print "=== add ==="
    print $ add (Complex 5 6) (Complex 10 2) -- Complex 15 8
    print "=== multiply ==="
    print $ multiply (Complex 3 4) 6 -- Complex 18 4
    print "=== getReal ==="
    print $ getReal (Complex 2 3) -- 2
    print "=== getImaginary ==="
    print $ getImaginary (Complex 2 3) -- 3
    print "=== The RGB color mode ==="
    print "=== getR ==="
    print $ getR (RGB (150, 30, 25)) -- 150
    print "=== getG ==="
    print $ getG (RGB (150, 30, 25)) -- 30
    print "=== getB ==="
    print $ getB (RGB (150, 30, 25)) -- 25
    print "=== getMaxComponent ==="
    print $ getMaxComponent (RGB (17, 78, 63)) -- ("Green", 78)
    print "=== combine ==="
    print $ combine (RGB (120, 120, 60)) (RGB (150, 70, 80)) -- RGB (135, 95, 70)
    print "=== Playing cards ==="
    print "=== getValue ==="
    print $ getValue (Card King Diamonds) -- 13
    print $ getValue (Card Three Spades) -- 3
    print "=== getColor ==="
    print $ getColor (Card King Diamonds) -- Red
    print $ getColor (Card Three Spades) -- Black
    