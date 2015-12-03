any1 :: (a -> Bool) -> [a] -> Bool

{-worong
any1 p = map p . or
-}

{-right
any1 p = or . map p
-}


{-right
any1 p xs = length (filter p xs) > 0
-}

{-right
any1 p = not . null . dropWhile (not . p)
-}


{-wrong
any1 p = null . filter p
-}

{-right 
any1 p xs = not (all (\ x -> not (p x)) xs)
-}

{-right
any1 p xs = foldr (\ x acc -> (p x) || acc) False xs
-}

-- wrong
any1 p xs = foldr (||) True (map p xs)






