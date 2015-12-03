find :: (Eq a) => a -> [(a, b)] -> [b]
find k t = [v | (k', v) <- t, k == k']

positions :: (Eq a) => a -> [a] -> [Int]
{- right
positions x xs = find x (zip xs [0 .. n])
  where n = length xs - 1

-}

-- positions x xs = find x xs

{-
positions x xs = find x (zipWith (+) xs [0 .. n])
  where n = length xs - 1
-}

-- wrong
positions x xs = find n (zip xs [0 .. x])
  where n = length xs - 1

