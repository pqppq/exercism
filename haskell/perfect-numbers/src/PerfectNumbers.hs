module PerfectNumbers (classify, Classification (..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify n
  | n <= 0 = Nothing
  | s < n = Just Deficient
  | s > n = Just Abundant
  | s == n = Just Perfect
  | otherwise = Nothing
  where
    s = aliqSum n

aliqSum :: Int -> Int
aliqSum n = sum [i | i <- [1 .. pred n], n `mod` i == 0]
