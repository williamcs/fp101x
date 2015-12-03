filter1 :: (a -> Bool) -> [a] -> [a]

{-wrong
filter1 p = foldl (\ xs x -> if p x then x : xs else xs) []
-}

{-right 
filter1 p = foldr (\ x xs -> if p x then x : xs else xs) []
-}

{-wrong
filter1 p = foldr (\ x xs -> if p x then xs ++ [x] else xs) []
-}

filter1 p = foldl (\ x xs -> if p x then xs ++ [x] else xs) []
 












