-- https://projecteuler.net/problem=9
--
-- Special Pythagorean triplet
--
-- Problem 9
-- 
-- A Pythagorean triplet is a set of three natural numbers, a &lt; b &lt; c, for which,
-- For example, 32 + 42 = 9 + 16 = 25 = 52.
-- There exists exactly one Pythagorean triplet for which a + b + c = 1000.Find the product abc.
--

module Main where

nextTriplet :: (Ord a, Num a) => a -> (a, a, a) -> (a, a, a)
nextTriplet totalSum (a,b,c)
    | b + 1 < c - 1  = (a, b+1, c-1)
    | a + 1 >= b     = error "No more triplets available!"
    | otherwise      = (a+1, a+2, totalSum - 2 * a - 3)


nextTripletOf1000 :: (Ord a, Num a) => (a, a, a) -> (a, a, a)
nextTripletOf1000 = nextTriplet 1000


isPythagorean :: (Num a, Eq a) => (a, a, a) -> Bool
isPythagorean (a,b,c) = a^2 + b^2 == c^2


tripleProduct :: (Num a) => (a, a, a) -> a
tripleProduct (a, b, c) = a * b * c


findTriplet :: (t -> Bool) -> t -> (t -> t) -> t
findTriplet pred triplet getNext
    | pred triplet = triplet
    | otherwise    = findTriplet pred (getNext triplet) getNext


main = do
    print (tripleProduct (findTriplet (isPythagorean) (1,2,997) nextTripletOf1000))

