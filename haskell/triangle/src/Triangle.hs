module Triangle (TriangleType (..), triangleType) where

import Data.List (nub)

data TriangleType
  = Equilateral
  | Isosceles
  | Scalene
  | Illegal
  deriving (Eq, Show)

triangleType :: (Num a, Ord a) => a -> a -> a -> TriangleType
triangleType a b c
  | isIllegal (a, b, c) = Illegal
  | length (nub [a, b, c]) == 1 = Equilateral
  | length (nub [a, b, c]) == 2 = Isosceles
  | otherwise = Scalene

isIllegal :: (Num a, Ord a) => (a, a, a) -> Bool
isIllegal (a, b, c) = any (<= 0) [a, b, c] || any isNotTriangle [(a, b, c), (b, c, a), (c, a, b)]

isNotTriangle :: (Num a, Ord a) => (a, a, a) -> Bool
isNotTriangle (a, b, c) = (a + b) < c
