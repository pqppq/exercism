module CryptoSquare (encode) where

import Data.Char (isAlphaNum, toLower)

encode :: String -> String
encode xs = unwords $ map (takeN splited) [0 .. c - 1]
  where
    norm = normalize xs
    (c, _) = calSize (length norm)
    splited = splitString c norm

-- normalize input
normalize :: String -> String
normalize = map toLower . filter isAlphaNum

-- calculate size of rect
calSize :: Int -> (Int, Int)
calSize n = head [(c, r) | c <- [1 ..], r <- [1 .. c], c * r >= n]

-- split string into n chunk(last chunk with padding)
splitString :: Int -> String -> [String]
splitString _ [] = []
splitString n xs = takeStr n xs : splitString n (drop n xs)

-- take n characters with padding
takeStr :: Int -> String -> String
takeStr n xs = take n (xs ++ replicate n ' ')

-- take n-th character of strings
takeN :: [String] -> Int -> String
takeN xs n = map (!! n) xs
