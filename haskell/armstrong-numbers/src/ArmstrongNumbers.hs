module ArmstrongNumbers (armstrong) where

import Data.Char (digitToInt)

armstrong :: (Integral a) => a -> Bool
armstrong n = v == s
  where
    v = fromIntegral n
    m = length (show v)
    s = sum [digitToInt i ^ m | i <- show v]
