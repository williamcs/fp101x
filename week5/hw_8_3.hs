--wrong 
getLine' :: IO String
getLine' = get ""

get :: String -> IO String
get xs
  = do x <- getChar
       case x of
       	    ' ' -> return xs  -- this wrong
            '\n' -> return xs
            _ -> get (xs ++ [x])


{-wrong
getLine' :: IO String
getLine' = get ""

get :: String -> IO String
get xs
  = do x <- getChar
       case x of 
            '\n' -> return xs
            _ -> get (x : xs)
-}

{--right 
getLine' :: IO String
getLine' = get []

get :: String -> IO String
get xs
  = do x <- getChar
       case x of
            '\n' -> return xs
            _ -> get (xs ++ [x])
-}

{-wrong
getLine' :: IO String
getLine' = get []

get :: String -> IO String
get xs
  = do x <- getChar
       case x of
            '\n' -> return (x : xs)
            _ -> get (xs ++ [x])

-}





















