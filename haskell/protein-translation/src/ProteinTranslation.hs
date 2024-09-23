module ProteinTranslation (proteins) where

data Protein = Methionine | Phenylalanine | Leucine | Serine | Tyrosine | Cysteine | Tryptophan | STOP deriving (Show, Eq)

proteins :: String -> Maybe [String]
proteins s = map show <$> ps
  where
    ps = takeWhile (/= STOP) <$> textToProteins s

textToProteins :: String -> Maybe [Protein]
textToProteins text
  | null triplet = Just []
  | triplet == "AUG" = ([Methionine] ++) <$> textToProteins rest
  | triplet `elem` ["UUU", "UUC"] = ([Phenylalanine] ++) <$> textToProteins rest
  | triplet `elem` ["UUA", "UUG"] = ([Leucine] ++) <$> textToProteins rest
  | triplet `elem` ["UCU", "UCC", "UCA", "UCG"] = ([Serine] ++) <$> textToProteins rest
  | triplet `elem` ["UAU", "UAC"] = ([Tyrosine] ++) <$> textToProteins rest
  | triplet `elem` ["UGU", "UGC"] = ([Cysteine] ++) <$> textToProteins rest
  | triplet == "UGG" = ([Tryptophan] ++) <$> textToProteins rest
  | triplet `elem` ["UAA", "UAG", "UGA"] = Just [STOP]
  | otherwise = Nothing
  where
    triplet = take 3 text
    rest = drop 3 text
