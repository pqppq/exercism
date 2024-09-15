module Anagram (anagramsFor) where

import Data.Char (toLower)
import Data.List (permutations)

anagramsFor :: String -> [String] -> [String]
anagramsFor sub cands
  | sub `elem` cands = [] -- words are not anagrams of themselves
  | otherwise = filter (\c -> map toLower c `elem` pems) cands
  where
    pems = permutations (map toLower sub)
