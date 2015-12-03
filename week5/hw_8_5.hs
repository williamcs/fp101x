sequence_' :: Monad m => [m a] -> m ()

{- wrong
sequence_' [] = return []
sequence_' (m : ms) = m >> \ _ -> sequence_' ms
-}

--right
sequence_' [] = return ()
sequence_' (m : ms) = (foldl (>>) m ms) >> return ()


{-wrong
sequence_' ms = foldl (>>) (return ()) ms
-}

{-right
sequence_' [] = return ()
sequence_' (m : ms) = m >> sequence_' ms
-}

{-right
sequence_' [] = return ()
sequence_' (m : ms) = m >>= \ _ -> sequence_' ms
-}

{-wrong
sequence_' ms = foldr (>>=) (return ()) ms
-}

{-right
sequence_' ms = foldr (>>) (return ()) ms
-}

{-wrong
sequence_' ms = foldr (>>) (return []) ms
-}











