replicate1 :: Int -> a -> [a]

replicate1 0 _ = []
replicate1 n x = x : replicate1 (n - 1) x