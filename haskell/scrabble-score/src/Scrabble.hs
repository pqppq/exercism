module Scrabble (scoreLetter, scoreWord) where

import Data.Char (toUpper)

scoreLetter :: Char -> Integer
scoreLetter char
  | c `elem` "AEIOULNRST" = 1
  | c `elem` "DG" = 2
  | c `elem` "BCMP" = 3
  | c `elem` "FHVWY" = 4
  | c `elem` "K" = 5
  | c `elem` "JX" = 8
  | c `elem` "QZ" = 10
  | otherwise = 0
  where
    c = toUpper char

scoreWord :: String -> Integer
scoreWord word = sum $ map scoreLetter word
