module Clock (addDelta, fromHourMin, toString) where

import Text.Printf (printf)

data Clock = Clock
  { hour :: Int,
    minute :: Int
  }
  deriving (Show, Eq)

fromHourMin :: Int -> Int -> Clock
fromHourMin h m = Clock {hour = _h, minute = _m}
  where
    _m = m `mod` 60
    __h = m `div` 60
    _h = (h + __h) `mod` 24

toString :: Clock -> String
toString clock = printf "%02d:%02d" (hour clock) (minute clock)

addDelta :: Int -> Int -> Clock -> Clock
addDelta h m clock = Clock {hour = _h, minute = _m}
  where
    _m = (minute clock + m) `mod` 60
    __h = (minute clock + m) `div` 60
    _h = (hour clock + h + __h) `mod` 24
