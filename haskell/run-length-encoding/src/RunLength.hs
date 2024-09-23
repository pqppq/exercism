module RunLength (decode, encode) where

import Data.Char (isNumber)
import Text.Printf (printf)

decode :: String -> String
decode encodedText = concatMap expand $ scan2 encodedText

encode :: String -> String
encode text = concatMap shorten (scan text)

count :: Char -> String -> Int
count c s = length $ takeWhile (== c) s

skip :: Char -> String -> String
skip c = dropWhile (== c)

scan :: String -> [(Char, Int)]
scan [] = []
scan str@(s : sx) = (s, count s str) : scan (skip s sx)

shorten :: (Char, Int) -> String
shorten (c, 1) = [c]
shorten (c, n) = show n ++ [c]

scan2 :: String -> [(Char, Int)]
scan2 [] = []
scan2 text = (s, n) : scan2 xs
  where
    ns = takeWhile isNumber text
    n = if null ns then 1 else (read ns :: Int)
    (s : xs) = drop (length ns) text
		-- -> span isNumber text

expand :: (Char, Int) -> String
expand (c, n) = replicate n c
