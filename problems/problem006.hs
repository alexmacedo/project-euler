-- https://projecteuler.net/problem=6
--
-- Sum square difference
--
-- Problem 6
-- 
-- The sum of the squares of the first ten natural numbers is,
-- The square of the sum of the first ten natural numbers is,
-- Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 &minus; 385 = 2640.
-- Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
--

module Main where

sumOfSquares :: (Integral a) => a -> a
sumOfSquares n = sum (map (^2) [1..n])

squareOfSum :: (Integral a) => a -> a
squareOfSum n = (sum [1..n])^2

main :: IO ()
main = print ((squareOfSum 100) - (sumOfSquares 100))

