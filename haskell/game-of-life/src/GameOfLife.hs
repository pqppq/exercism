module GameOfLife (tick) where

type Board = [[Int]]

type Pos = (Int, Int)

tick :: Board -> Board
tick b = pack (cols b) nexts
  where
    pos = positions b
    ns = map (neighbors b) pos
    nearAlives = map (sum . map (getElem b)) ns
    nexts = [next (getElem b p) s | (p, s) <- zip pos nearAlives]

pack :: Int -> [Int] -> [[Int]]
pack n xs
  | null xs  = []
  | length xs <= n = [xs]
  | otherwise = take n xs : pack n (drop n xs)

rows :: Board -> Int
rows = length

cols :: Board -> Int
cols [] = 0
cols (c : _) = length c

size :: Board -> (Int, Int)
size b = (rows b, cols b)

getElem :: Board -> Pos -> Int
getElem m (x, y) = (m !! x) !! y

neighbors :: Board -> Pos -> [Pos]
neighbors b (x, y) = filter (inBoard b) [(x - 1, y), (x + 1, y), (x, y - 1), (x, y + 1), (x - 1, y - 1), (x - 1, y + 1), (x + 1, y - 1), (x + 1, y + 1)]

inBoard :: Board -> Pos -> Bool
inBoard b (x, y) = (0 <= x && x <= m - 1) && (0 <= y && y <= l - 1)
  where
    (m, l) = size b

-- 1-d position array
positions :: Board -> [Pos]
positions b = [(i, j) | i <- [0 .. m - 1], j <- [0 .. l - 1]]
  where
    (m, l) = size b

next :: Int -> Int -> Int
next state n
  | state == 1 && (n == 2 || n == 3) = 1
  | state == 0 && n == 3 = 1
  | otherwise = 0
