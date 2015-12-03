-- wrong
{-
halve xs = (take n xs, drop n xs)
  where n = length xs / 2
-}

-- right
{-
halve xs = splitAt(length xs `div` 2) xs
-}

-- right
{-
halve xs = (take (n `div` 2) xs, drop (n `div` 2) xs)
  where n = length xs
-}

-- wrong
--halve xs = splitAt (length xs `div` 2)

-- wrong, can't equal divide
halve xs = (take n xs, drop (n + 1) xs)
  where n = length xs `div` 2

-- right
--halve xs = splitAt (div (length xs) 2) xs

-- wronog
--halve xs = splitAt (length xs / 2) xs

-- right
--halve xs = (take n xs, drop n xs)
--  where n = length xs `div` 2