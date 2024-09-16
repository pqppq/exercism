module Robot
  ( Bearing (East, North, South, West),
    bearing,
    coordinates,
    mkRobot,
    move,
  )
where

data Bearing
  = North
  | East
  | South
  | West
  deriving (Eq, Show)

type Coordinates = (Integer, Integer)

data Robot = Robot
  { bearing :: Bearing,
    coordinates :: Coordinates
  }

turnRight :: Robot -> Robot
turnRight robot@(Robot b _) = case b of
  North -> robot {bearing = East}
  East -> robot {bearing = South}
  South -> robot {bearing = West}
  West -> robot {bearing = North}

turnLeft :: Robot -> Robot
turnLeft robot@(Robot b _) = case b of
  North -> robot {bearing = West}
  East -> robot {bearing = North}
  South -> robot {bearing = East}
  West -> robot {bearing = South}

advance :: Robot -> Robot
advance robot@(Robot b (x, y)) = case b of
  North -> robot {coordinates = (x, y + 1)}
  East -> robot {coordinates = (x + 1, y)}
  South -> robot {coordinates = (x, y - 1)}
  West -> robot {coordinates = (x - 1, y)}

mkRobot :: Bearing -> Coordinates -> Robot
mkRobot d c = Robot {bearing = d, coordinates = c}

action :: Char -> (Robot -> Robot)
action c = case c of
  'R' -> turnRight
  'L' -> turnLeft
  'A' -> advance
  _ -> id

move :: Robot -> String -> Robot
move = foldl (flip action)

