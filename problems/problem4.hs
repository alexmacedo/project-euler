-- https://projecteuler.net/problem=4
--
-- Largest palindrome product
--
-- Problem 4
--
-- A palindromic number reads the same both ways. The largest palindrome made 
-- from the product of two 2-digit numbers is 9009 = 91 × 99.
--
-- Find the largest palindrome made from the product of two 3-digit numbers.
--

module Main where

numberToList :: Integral a => a -> [a] -> [a]
numberToList x l
    | x == 0    = l
    | x < 10    = x:l
    | otherwise = numberToList (x `div` 10) ((x `mod` 10):l)


isPalindrome :: Integral a => a -> Bool
isPalindrome x = 
    let l = numberToList x []
    in l == (reverse l)

palindromes :: Integral a => a -> a -> [a]
palindromes x y
    | x < 100            = []
    | y < 100            = palindromes (x - 1) (x - 1)
    | isPalindrome (x*y) = (x*y):(palindromes x  (y - 1))
    | otherwise          = palindromes x  (y - 1)


main :: IO ()
main = print (maximum (palindromes 999 999))

