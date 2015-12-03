sequence_' :: Monad m => [m a] -> m ()
sequence_' [] = return ()
sequence_' (m : ms) = (foldl (>>) m ms) >> return ()

sequence' :: Monad m => [m a] -> m [a]
sequence' [] = return []
sequence' (m : ms)
  = m >>=
      \ a ->
        do as <- sequence' ms
           return (a : as)

--test mapM' (\x -> [x]) [0, 1, 2]

mapM' :: Monad m => (a -> m b) -> [a] -> m [b]

{-right
mapM' f as = sequence' (map f as)
-}

{-right
mapM' f [] = return []
mapM' f (a : as) = f a >>= \ b -> mapM' f as >>= \ bs -> return (b : bs)
-}

{-wrong
mapM' f as = sequence_' (map f as)
-}

{-wrong
mapM' f [] = return []
mapM' f (a : as) = f a >> \ b -> mapM' f as >> \ bs -> return (b : bs)
-}

{-wrong
mapM' f [] = return []
mapM' f (a : as) =
    do
        f a -> b
        mapM' f as -> bs
        return (b : bs)
-}

{-right
mapM' f [] = return []
mapM' f (a : as) = do b <- f a
                      bs <- mapM' f as
                      return (b : bs)
-}

{-right
mapM' f [] = return []
mapM' f (a : as) = f a >>= \ b ->
    do bs <- mapM' f as
       return (b : bs)
-}

{-wrong-}
mapM' f [] = return []
mapM' f (a : as) = f a >>= \ b ->
    do bs <- mapM' f as
       return (bs ++ [b])
