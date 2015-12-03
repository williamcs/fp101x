foldLeftM :: Monad m => (b -> a -> m b) -> b -> [a] -> m b
foldLeftM _ acc [] = return acc
foldLeftM f acc (x:xs) = f acc x >>= (\ b' -> foldLeftM f b' xs)