-- test
--liftM (* 3) [1, 2, 3]


liftM :: Monad m => (a -> b) -> m a -> m b

{-right
liftM f m
  = do x <- m
       return (f x)
-}

{-wrong
liftM f m = m >>= \ a -> f a
-}

{-right
liftM f m = m >>= \ a -> return (f a)
-}

{-wrong
liftM f m = return (f m)
-}

{-wrong
liftM f m = m >>= \ a -> m >>= \ b -> return (f a)
-}

{-wrong
liftM f m = m >>= \ a -> m >>= \ b -> return (f b)
-}

{-wrong
liftM f m = mapM f [m]
-}

--wrong
liftM f m = m >> \ a -> return (f a)




