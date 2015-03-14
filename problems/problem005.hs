-- https://projecteuler.net/problem=5
--
-- Smallest multiple
--
-- Problem 5
-- 
-- 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
-- What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
--

module Main where

isDivisible :: (Integral a) => a -> Bool
isDivisible n = sum ([n `mod` x | x <- [2..20]]) == 0

stopWhen :: (a -> Bool) -> [a] -> a
stopWhen pred (x:xs)
    | pred x    = x
    | otherwise = stopWhen pred xs

main :: IO ()
main = print (stopWhen (isDivisible) [20,40..])

