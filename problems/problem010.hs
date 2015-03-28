-- https://projecteuler.net/problem=10
--
-- Summation of primes
--
-- Problem 10
-- 
-- The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
-- Find the sum of all the primes below two million.
--

module Main where


isPrime :: (Integral a) => a -> [a] -> Bool
isPrime _ [] = True
isPrime n (x:xs)
    | 2*x > n        = True
    | n `mod` x /= 0 = isPrime n xs
    | otherwise      = False


allPrimes :: (Integral a) => a -> [a] -> [a]
allPrimes _ [] = []
allPrimes limit xs
    | (last xs) > limit  = init xs
    | isPrime (last xs) (init xs) = allPrimes limit (xs ++ [(last xs) + 2])
    | otherwise    = allPrimes limit ((init xs) ++ [(last xs) + 2])

main = do
    print $ sum $ allPrimes 2000000 [2,3,5,7,11,13]

