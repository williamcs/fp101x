-- filterM' (const [True,False]) "123"
--["123","12","13","1","23","2","3",""]

filterM' :: Monad m => (a -> m Bool) -> [a] -> m [a]

{-wrong
filterM' _ [] = return []
filterM' p (x : xs) = do flag <- p x
                         ys <- filterM' p xs
                         return (x : ys)
-}

{-right
filterM' _ [] = return []
filterM' p (x : xs) = do flag <- p x
                         ys <- filterM' p xs
                         if flag then return (x : ys) else return ys
-}

{-wrong
filterM' _ [] = return []
filterM' p (x : xs) = do ys <- filterM' p xs
                         if p x then return (x : ys) else return ys
-}

--wrong
filterM' _ [] = return []
filterM' p (x : xs) = do flag <- p x
                         ys <- filterM' p xs
                         if flag then return ys else return (x : ys)
