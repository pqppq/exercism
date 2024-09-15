{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Redundant ==" #-}
module Bob (responseFor) where

import Data.Char (isAlpha, isSpace, isUpper)

responseFor :: String -> String
responseFor s
  | isSilence s = "Fine. Be that way!"
  | isYellingQuestion s = "Calm down, I know what I'm doing!"
  | isYelling s = "Whoa, chill out!"
  | isQuestion s = "Sure."
  | otherwise = "Whatever."

trim :: String -> String
trim = unwords . words

isQuestion :: String -> Bool
isQuestion s = last (trim s) == '?'

isSilence :: String -> Bool
isSilence = all isSpace

isYelling :: String -> Bool
isYelling xs = any isAlpha xs && all isUpper (filter isAlpha xs)

isYellingQuestion :: String -> Bool
isYellingQuestion xs = isYelling xs && isQuestion xs
