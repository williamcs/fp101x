--concat1 :: [[a]] -> [a]

{-wrong
concat1 [] = []
concat1 (xs : xss) = xs : concat1 xss
-}

{-right
concat1 [] = []
concat1 (xs : xss) = xs ++ concat1 xss
-}

-- wrong
concat1 [[]] = []
concat1 (xs : xss) = xs ++ concat1 xss