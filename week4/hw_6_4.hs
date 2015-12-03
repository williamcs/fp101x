dropWhile1 :: (a -> Bool) -> [a] -> [a]

{-right
dropWhile1 _ [] = []
dropWhile1 p (x : xs)
  | p x = dropWhile1 p xs
  | otherwise = x : xs
-}

{-wrong
dropWhile1 _ [] = []
dropWhile1 p (x : xs)
  | p x = dropWhile1 p xs
  | otherwise = xs
-}

{-wrong
dropWhile1 p = foldr (\ x acc -> if p x then acc else x : acc) []
-}

--wrong
dropWhile1 p = foldl add []
  where add [] x = if p x then [] else [x]
        add acc x = x : acc



