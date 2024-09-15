module Luhn (isValid) where

import Data.Char (digitToInt, isDigit)

isValid :: String -> Bool
isValid "0" = False
isValid n = length target > 1 && proc target `mod` 10 == 0
  where
    target = reverse $ filter isDigit n

proc :: String -> Int
proc xs = sum $ [limit $ toDigit (even i) c | (i, c) <- zip [1 ..] xs]
  where
    limit n = if n > 9 then n - 9 else n
    toDigit toDouble c = if toDouble then 2 * digitToInt c else digitToInt c
