module IsbnVerifier (isbn) where

import Data.Char (digitToInt, isNumber)

isbn :: String -> Bool
isbn text = isValidFormat text && isValidCheckSum text

isValidFormat :: String -> Bool
isValidFormat text = (isValidFormatWithDashes text) || (isValidFormatWithoutDashes text)

isValidFormatWithDashes :: String -> Bool
isValidFormatWithDashes text = (text !! 1 == '-') && (text !! 5 == '-') && (text !! 11 == '-') && ((length maybeNums == 9 && last text == 'X') || length maybeNums == 10)
  where
    maybeNums = filter isNumber text

isValidFormatWithoutDashes :: String -> Bool
isValidFormatWithoutDashes text = length text == 10 && (isAllDigit text || ((isAllDigit $ init text) && last text == 'X'))

isAllDigit :: String -> Bool
isAllDigit = all isNumber

isValidCheckSum :: String -> Bool
isValidCheckSum text = s `mod` 11 == 0
  where
    ns = map digitToInt $ filter isNumber text
    s = sum (zipWith (*) [10, 9 .. 1] ns) + (if last text == 'X' then 10 else 0)
