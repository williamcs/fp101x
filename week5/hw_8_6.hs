sequence' :: Monad m => [m a] -> m [a]

{-right
sequence' [] = return []
sequence' (m : ms)
  = m >>=
  	  \ a ->
  	    do as <- sequence' ms
  	       return (a : as)
-}

{-wrong
sequence' ms = foldr func (return ()) ms
    where
        func :: (Monad m) => m a -> m [a] -> m [a]
        func m acc = do x <- m
                        xs <- acc
                        return (x : xs)
-}

{-wrong
sequence' ms = foldr func (return []) ms
  where
        func :: (Monad m) => m a -> m [a] -> m [a]
        func m acc = m : acc
-}

{-wrong
sequence' [] = return []
sequence' (m : ms) = return (a : as)
    where
        a <- m
        as <- sequence'd ms
-}

{-right
sequence' ms = foldr func (return []) ms
  where
        func :: (Monad m) => m a -> m [a] -> m [a]
        func m acc = do x <- m
                        xs <- acc
                        return (x : xs)
-}

{-wrong
sequence' [] = return []
sequence' (m : ms) 
  = m >> 
      \a ->
       do as <- sequence ms
          return (a : as)
-}

{-wrong
sequence' [] = return []
sequence' (m : ms) = m >>= \a ->
    as <- sequence' ms
    return (a : as)
-}

--right
sequence' [] = return []
sequence' (m : ms) = do a <- m
                        as <- sequence' ms
                        return (a : as)



