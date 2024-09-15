module DNA (toRNA) where
import Data.Either (partitionEithers)

toRNA :: String -> Either Char String
toRNA s =
  let (lefts, rights) = partitionEithers (map translate s)
   in if null lefts
        then Right rights
        else Left (head lefts)

translate :: Char -> Either Char Char
translate s
  | s == 'G' = Right 'C'
  | s == 'C' = Right 'G'
  | s == 'T' = Right 'A'
  | s == 'A' = Right 'U' | otherwise = Left s
