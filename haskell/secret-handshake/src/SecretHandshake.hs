module SecretHandshake (handshake) where

import Data.Bits
import Data.Maybe (catMaybes)

handshake :: Int -> [String]
handshake n = checkReverse n $ catMaybes [f n | f <- fs]
  where
    fs = [wink, blink, closeEyes, jump]

wink :: Int -> Maybe String
wink n
  | testBit n 0 = Just "wink"
  | otherwise = Nothing

blink :: Int -> Maybe String
blink n
  | testBit n 1 = Just "double blink"
  | otherwise = Nothing

closeEyes :: Int -> Maybe String
closeEyes n
  | testBit n 2 = Just "close your eyes"
  | otherwise = Nothing

jump :: Int -> Maybe String
jump n
  | testBit n 3 = Just "jump"
  | otherwise = Nothing

checkReverse :: Int -> [String] -> [String]
checkReverse n xs
  | testBit n 4 = reverse xs
  | otherwise = xs
