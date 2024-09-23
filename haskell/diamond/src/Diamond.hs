{-# OPTIONS_GHC -Wno-incomplete-uni-patterns #-}

module Diamond (diamond) where

import Data.Char (ord)

diamond :: Char -> Maybe [String]
diamond c
  | c `elem` ['A' .. 'Z'] = Just d
  | otherwise = Nothing
  where
    h = charToInt c
    s = [line h i x | (i, x) <- zip [1 ..] ['A' .. c]]
    d = s ++ tail (reverse s)

charToInt :: Char -> Int
charToInt c = ord c - 64

line :: Int -> Int -> Char -> String
line h n c =
  let (i, j) = ((h - 1) - (n - 1), (h - 1) + (n - 1))
   in replaceAt i c $ replaceAt j c (replicate (2 * h - 1) ' ')

replaceAt :: Int -> Char -> String -> String
replaceAt i c s =
  let (before, _ : after) = splitAt i s
   in before ++ [c] ++ after
