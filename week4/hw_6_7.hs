dec2int :: [Integer] -> Integer

{-wrong
dec2int = foldr (\ x y -> 10 * x + y) 0
-}

{- wrong
dec2int = foldl (\ x y -> x + 10 * y) 0
-}

{-right
dec2int = foldl (\ x y -> 10 * x + y) 0
-}

--wrong
dec2int = foldr (\ x y -> x + 10 * y) 0




