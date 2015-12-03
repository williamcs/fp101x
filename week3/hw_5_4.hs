and1 :: [Bool] -> Bool

{-right 
and1 [] = True
and1 (b : bs) = b && and1 bs
-}

{- right
and1 [] = True
and1 (b : bs)
  | b = and bs
  | otherwise = False
-}

{- wrong
and1 [] = False
and1 (b : bs)
  | b = and1 bs
  | otherwise = False
-}

{-right
and1 [] = True
and1 (b : bs) 
  | b == False = False
  | otherwise = and1 bs
-}

and1 [] = True
and1 (b : bs) = b || and1 bs 

{-right 
and1 [] = True
and1 (b : bs) = and1 bs && b
-}

-- wrong
{-
and1 [] = True
and1 (b : bs)
  | b = b
  | otherwise = and bs
-}






