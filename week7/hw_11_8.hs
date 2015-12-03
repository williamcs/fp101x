fibs :: [Integer]
fibs = 0 : 1 : [x + y | (x, y) <- zip fibs (tail fibs)]

largeFib :: Integer

{-right
largeFib = head(dropWhile (<= 1000) fibs)
-}

{-wrong
largeFib = last (take 19 fibs)
-}

{-wrong
largeFib = filter (> 1000) fibs
-}

{-wrong
largeFib = head (drop 1000 fibs)
-}