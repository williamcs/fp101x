all1 :: (a -> Bool) -> [a] -> Bool

-- right
{-
all1 p xs = and (map p xs)
-}

-- wrong
{-
all1 p xs = map p (and xs)
-}

{-right 
all1 p = and . map p
-}

{-right
all1 p = not . any (not . p)
-}

{-wrong
all1 p = map p . and
-}

{-right
all1 p xs = foldl (&&) True (map p xs)
-}

{-wrong
all1 p xs = foldr (&&) False (map p xs)
-}

-- right
all1 p = foldr (&&) True . map p

