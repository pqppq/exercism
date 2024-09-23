module ETL (transform) where

import Data.Char (toLower)
import Data.Map (Map, empty, insertWith, toList)

transform :: Map Int String -> Map Char Int
transform legacyData = foldl (\acc (c, n) -> insert acc (c, n)) empty pairs
  where
    pairs = concatMap (\(k, v) -> [(toLower c, k) | c <- v]) (toList legacyData)

insert :: Map Char Int -> (Char, Int) -> Map Char Int
insert acc (c, n) = insertWith (+) c n acc
