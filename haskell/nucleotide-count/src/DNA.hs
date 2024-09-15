module DNA (nucleotideCounts, Nucleotide (..)) where

import Data.Map (Map)
import qualified Data.Map as Map
import Data.Maybe (catMaybes, isJust)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs =
  let rnas = map charToNucleotide xs
   in if all isJust rnas
        then Right $ Map.fromListWith (+) [(c, 1) | c <- catMaybes rnas]
        else Left xs


charToNucleotide :: Char -> Maybe Nucleotide
charToNucleotide 'A' = Just A
charToNucleotide 'C' = Just C
charToNucleotide 'G' = Just G
charToNucleotide 'T' = Just T
charToNucleotide _ = Nothing
