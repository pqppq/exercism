module Prime (nth) where

nth :: Int -> Maybe Integer
nth n
  | n <= 0 = Nothing
  | otherwise = Just $ toInteger $ sieve !! (n - 1)

-- list of primes
sieve :: [Int]
sieve = sieve' [2 ..]
  where
    sieve' (p : xs) = p : sieve' [x | x <- xs, x `mod` p /= 0]
