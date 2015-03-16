-- https://projecteuler.net/problem=7
--
-- 10001st prime
--
-- Problem 7
-- 
-- By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
-- What is the 10 001st prime number?
--

module Main where

isPrime :: (Integral a) => a -> [a] -> Bool
isPrime _ [] = True
isPrime n (x:xs)
    | n `mod` x /= 0 = isPrime n xs
    | otherwise      = False

allPrimes :: (Integral a) => [a] -> [a]
allPrimes [] = []
allPrimes (x:xs)
    | length xs > 10000  = xs
    | isPrime x xs       = allPrimes $ (x + 2):x:xs
    | otherwise          = allPrimes $ (x + 2):xs

main = do
    print $ head $ allPrimes [13,11,7,5,3,2]

