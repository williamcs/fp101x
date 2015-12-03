takeWhile1 :: (a -> Bool) -> [a] -> [a]

{-wrong
takeWhile1 _ [] = []
takeWhile1 p (x : xs)
  | p x = x : takeWhile1 p xs
  | otherwise = takeWhile1 p xs
-}

{- right
takeWhile1 _ [] = []
takeWhile1 p (x : xs)
  | p x = x : takeWhile1 p xs
  | otherwise = []
-}

{-wrong 
takeWhile1 _ [] = []
takeWhile1 p (x : xs)
  | p x = takeWhile1 p xs
  | otherwise = []
-}

-- wrong
takeWhile1 p = foldl (\ acc x -> if p x then x : acc else acc) []









