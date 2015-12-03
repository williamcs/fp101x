foldRightM :: Monad m => (a -> b -> m b) -> b -> [a] -> m b
foldRightM _ z [] = return z
foldRightM f z (x:xs) = (foldRightM f z xs) >>= f x
