module Yacht (yacht, Category (..)) where

data Category
  = Ones
  | Twos
  | Threes
  | Fours
  | Fives
  | Sixes
  | FullHouse
  | FourOfAKind
  | LittleStraight
  | BigStraight
  | Choice
  | Yacht
  deriving (Eq)

yacht :: Category -> [Int] -> Int
yacht category dice
  | category == Ones = countNumber dice 1
  | category == Twos = 2 * countNumber dice 2
  | category == Threes = 3 * countNumber dice 3
  | category == Fours = 4 * countNumber dice 4
  | category == Fives = 5 * countNumber dice 5
  | category == Sixes = 6 * countNumber dice 6
  | category == FullHouse = sum dice
  | category == FourOfAKind = 0
  | category == LittleStraight = 30
  | category == BigStraight = 30
  | category == Choice = sum dice
  | category == Yacht = 50

countNumber :: [Int] -> Int -> Int
countNumber list n = length $ filter (== n) list
