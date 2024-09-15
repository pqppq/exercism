module Darts (score) where

score :: Float -> Float -> Int
score x y
  | dist <= square 1 = 10
  | dist <= square 5 = 5
  | dist <= square 10 = 1
  | otherwise = 0
  where dist = square x + square y

square :: Float -> Float
square x = x * x
