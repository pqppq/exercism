module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n
  | n > 0 = Just (collatzStep n 0)
  | otherwise = Nothing

collatzStep :: Integer -> Integer -> Integer
collatzStep 1 step = step
collatzStep n step
  | even n = collatzStep (n `div` 2) (step + 1)
  | otherwise = collatzStep (3 * n + 1) (step + 1)
