module SpaceAge (Planet (..), ageOn) where

data Planet
  = Mercury
  | Venus
  | Earth
  | Mars
  | Jupiter
  | Saturn
  | Uranus
  | Neptune

ageOn :: Planet -> Float -> Float
ageOn Mercury seconds = earthAge seconds / 0.2408467
ageOn Venus seconds = earthAge seconds / 0.61519726
ageOn Earth seconds = earthAge seconds
ageOn Mars seconds = earthAge seconds / 1.8808158
ageOn Jupiter seconds = earthAge seconds / 11.862615
ageOn Saturn seconds = earthAge seconds / 29.447498
ageOn Uranus seconds = earthAge seconds / 84.016846
ageOn Neptune seconds = earthAge seconds / 164.79132

earthAge :: Float -> Float
earthAge t = t / 31557600
