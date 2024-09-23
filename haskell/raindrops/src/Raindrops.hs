module Raindrops (convert) where

convert :: Int -> String
convert n
  | n `mod` (3 * 5 * 7) == 0 = "PlingPlangPlong"
  | n `mod` (3 * 5) == 0 = "PlingPlang"
  | n `mod` (5 * 7) == 0 = "PlangPlong"
  | n `mod` (3 * 7) == 0 = "PlingPlong"
  | n `mod` 7 == 0 = "Plong"
  | n `mod` 5 == 0 = "Plang"
  | n `mod` 3 == 0 = "Pling"
  | otherwise = show n
