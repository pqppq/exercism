{-# LANGUAGE NumDecimals #-}

module ResistorColors (Color (..), Resistor (..), label, ohms) where

data Color
  = Black
  | Brown
  | Red
  | Orange
  | Yellow
  | Green
  | Blue
  | Violet
  | Grey
  | White
  deriving (Show, Enum, Bounded)

newt ype Resistor = Resistor {bands :: (Color, Color, Color)}
  deriving (Show)

label :: Resistor -> String
label r
  | n >= 1.0e9 = show (n `div` 1.0e9) ++ " gigaohms"
  | n >= 1.0e6 = show (n `div` 1.0e6) ++ " megaohms"
  | n >= 1.0e3 = show (n `div` 1.0e3) ++ " kiloohms"
  | otherwise = show n ++ " ohms"
  where
    n = ohms r

ohms :: Resistor -> Int
ohms (Resistor (a, b, c)) = (* 10 ^ fromEnum c) $ 10 * fromEnum a + fromEnum b
