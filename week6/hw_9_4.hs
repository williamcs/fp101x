
--data Ordering = LT | EQ | GT
--compare :: (Ord a) => a -> a -> Ordering
data Tree = Leaf Integer | Node Tree Integer Tree

t :: Tree
t = Node (Node (Leaf 1) 3 (Leaf 4)) 5 (Node (Leaf 6) 7 (Leaf 9))

occurs :: Integer -> Tree -> Bool


{-right
occurs m (Leaf n) = m == n
occurs m (Node l n r) = case compare m n of
    LT -> occurs m l
    EQ -> True
    GT -> occurs m r
-}

{-wrong
occurs m (Leaf n) = m == n
occurs m (Node l n r) = case compare m n of
    LT -> occurs m r
    EQ -> True
    GT -> occurs m l
-}

{-wrong
occurs m (Leaf n) = compare m n
occurs m (Node l n r) = case compare m n of
    LT -> occurs m l
    EQ -> True
    GT -> occurs m r
-}

{-wrong
occurs m (Leaf n) = m == n
occurs m (Node l n r) = case compare m n of
    LT -> occurs m l
    EQ -> False
    GT -> occurs m r
-}

{-right
occurs m (Leaf n) = m == n
occurs m (Node l n r)
    | m == n = True
    | m < n = occurs m l
    | otherwise = occurs m r
-}

{-wrong
occurs m (Leaf n) = m == n
occurs m (Node l n r)
    | m == n = True
    | m > n = occurs m l
    | otherwise = occurs m r
-}

{-wrong
occurs m n = m == n
occurs m (Node l n r)
    | m == n = True
    | m < n = occurs m l
    | otherwise = occurs m r
-}

--wrong
occurs m (Leaf n) = m == n
occurs m (Node l n r)
    | m == n = False
    | m < n = occurs m r
    | otherwise = occurs m l
