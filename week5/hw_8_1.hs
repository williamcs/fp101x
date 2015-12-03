putStr' :: String -> IO ()

putStr' [] = return ()
putStr' (x : xs) = putChar x >> putStr' xs

{-
putStr' [] = return ()
putStr' (x : xs) = do putChar x
                      putStr xs
-}

putStrLn' :: String -> IO ()

{- right
putStrLn' [] = putChar '\n'
putStrLn' xs = putStr' xs >> putStrLn' ""
-}

{-right
putStrLn' [] = putChar '\n'
putStrLn' xs = putStr' xs >> putChar '\n'
-}

{-wrong
putStrLn' [] = putChar '\n'
putStrLn' xs = putStr' xs >> \ x -> putChar '\n'
-}

{-right
putStrLn' [] = putChar '\n'
putStrLn' xs = putStr' xs >>= \ x -> putChar '\n'
-}

{-right
putStrLn' [] = putChar '\n'
putStrLn' xs = putStr' xs >> putStr' "\n"
-}

{-wrong
putStrLn' [] = putChar '\n'
putStrLn' xs = putStr' xs >> putStrLn' "\n"
-}

{-wrong
putStrLn' [] = return ""
putStrLn' xs = putStr' xs >> putStr' "\n"
-}

--wrong
putStrLn' [] = putChar "\n"
putStrLn' xs = putStr' xs >> putChar '\n'














