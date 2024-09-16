module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys
 | length xs /= length ys = Nothing
 | otherwise = Just $ length [(i, j) | (i, j) <- zip xs ys, i /= j]
