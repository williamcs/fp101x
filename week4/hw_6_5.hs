map1 :: (a -> b) -> [a] -> [b]

{-wrong
map1 f = foldr (\ x xs -> xs ++ [f x]) []
-}
{-wrong
map1 f = foldr (\ x xs -> f x ++ xs) []
-}

{-wrong
map1 f = foldl (\ xs x -> f x : xs) []
-}

map1 f = foldl (\ xs x -> xs ++ [f x]) []




