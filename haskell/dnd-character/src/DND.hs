module DND
  ( Character (..),
    ability,
    modifier,
    character,
  )
where

import Control.Monad (replicateM)
import Data.List (sortBy)
import Data.Ord (comparing)
import qualified Data.Ord
import Test.QuickCheck (Gen, choose)

data Character = Character
  { strength :: Int,
    dexterity :: Int,
    constitution :: Int,
    intelligence :: Int,
    wisdom :: Int,
    charisma :: Int,
    hitpoints :: Int
  }
  deriving (Show, Eq)

dice :: Gen Int
dice = choose (1, 6)

modifier :: Int -> Int
modifier n = (n - 10) `div` 2

ability :: Gen Int
ability = do
  vals <- replicateM 4 dice
  return $ sum $ take 3 $ sortBy (comparing Data.Ord.Down) vals

character :: Gen Character
character = do
  str <- ability
  dex <- ability
  con <- ability
  int <- ability
  wis <- ability
  chr <- ability
  return $ Character str dex con int wis chr $ 10 + modifier con
