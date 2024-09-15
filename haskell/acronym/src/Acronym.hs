module Acronym (abbreviate) where

import Data.Char (isLower, isUpper, toUpper)

abbreviate :: String -> String
abbreviate xs = concatMap getUppers $ words (splitWord xs)

splitWord :: String -> String
splitWord = map (\c -> if c == '-' then ' ' else c)

getUppers :: String -> String
getUppers xs
  | isLower $ head xs = [toUpper $ head xs] -- lower char, return first to upper
  | all isUpper xs = [head xs] -- all caps, return first
  | otherwise = filter isUpper xs -- maybe camel, filter upper chars
