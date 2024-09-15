module Minesweeper (annotate) where

import Data.Char (digitToInt, intToDigit)
import Data.List (transpose)

annotate :: [String] -> [String]
annotate board = transpose $ map process $ transpose $ map process board

process :: String -> String
process xs = reverse $ updateMineCount $ reverse $ updateMineCount xs

updateMineCount :: String -> String
updateMineCount "" = ""
updateMineCount ('*' : x : xs) = '*' : inc x : xs
updateMineCount ('*' : xs) = '*' : updateMineCount xs
updateMineCount (x : xs) = x : updateMineCount xs

inc :: Char -> Char
inc ' ' = '1'
inc '.' = '1'
inc '*' = '*'
inc n = intToDigit (digitToInt n)
