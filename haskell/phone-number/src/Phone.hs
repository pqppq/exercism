module Phone (number) where

number :: String -> Maybe String
number ['+' : '1' : '(' : a : b : c : ')' : '-' : d : e : f : '-' : g : h : i : j: []] = Just [a : b : c : d : e : f : g : h : i : j]

-- replace :: String -> String
-- replace = filter (`notElem` "-(). ")

-- isValid :: String -> String
-- isValid s = all isNumber s && length s == 7
