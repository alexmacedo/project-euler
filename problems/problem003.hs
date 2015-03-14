-- https://projecteuler.net/problem=3
--
-- Largest prime factor
-- 
-- Problem 3
--
-- The prime factors of 13195 are 5, 7, 13 and 29.
--
-- What is the largest prime factor of the number 600851475143 ?
--

module Main where

num = 600851475143

largestPrimeFactor :: (Integral a) => a -> a -> a
largestPrimeFactor n factor
    | n <= 1              = factor
    | n `mod` factor == 0 = largestPrimeFactor (n `div` factor) factor
    | otherwise           = largestPrimeFactor n (factor + 1)

main :: IO ()
main = print (largestPrimeFactor num 2)

