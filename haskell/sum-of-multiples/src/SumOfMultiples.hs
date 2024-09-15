module SumOfMultiples (sumOfMultiples) where

import Data.List (nub)

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = (sum . nub) (concatMap (toMulArray limit) factors)

toMulArray :: Integer -> Integer -> [Integer]
toMulArray limit factor = filter (< limit) (map (* factor) [1 .. limit])

sumOfMultiples2 :: [Integer] -> Integer -> Integer
sumOfMultiples2 factors limit = sum $ nub [x * y | x <- factors, y <- [1 .. limit], x * y < limit]
