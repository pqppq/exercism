module Triangle (rows) where

rows :: Int -> [[Integer]]
rows 0 = []
rows x = rows (x - 1) ++ [[comb (x - 1) i | i <- [0 .. x - 1]]]

fact :: Int -> Int
fact 0 = 1
fact n = n * fact (n - 1)

comb :: Int -> Int -> Integer
comb n k = toInteger $ fact n `div` (fact k * fact (n - k))
