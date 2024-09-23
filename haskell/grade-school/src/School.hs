module School (School, add, empty, grade, sorted) where

import Data.List (sort)
import Data.Map (Map, findWithDefault, fromList, insertWith, toList)

type School = Map Int [String]

add :: Int -> String -> School -> School
add gradeNum student school = insertWith (\a b -> sort $ a ++ b) gradeNum [student] school

empty :: School
empty = fromList []

grade :: Int -> School -> [String]
grade gradeNum school = findWithDefault [] gradeNum school

sorted :: School -> [(Int, [String])]
sorted school = sort $ toList school
