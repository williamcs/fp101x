putStr' :: String -> IO ()

putStr' [] = return ()
putStr' (x : xs) = putChar x >> putStr' xs

putStrLn' :: String -> IO ()
putStrLn' [] = putChar '\n'
putStrLn' xs = putStr' xs >> putStrLn' ""

getLine' :: IO String
getLine' = get []

get :: String -> IO String
get xs
  = do x <- getChar
       case x of
            '\n' -> return xs
            _ -> get (xs ++ [x])

interact' :: (String -> String) -> IO ()

--right
interact' f
  = do input <- getLine'
       putStrLn' (f input)


{-wrong
interact' f
  = do input <- getLine'
       putStrLn' input
-}

{-wrong
interact' f
  = do input <- getChar
       putStrLn' (f input)
-}

{-wrong
interact' f
  = do input <- getLine'
       putStr' (f input)
-}











