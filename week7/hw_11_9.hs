-- original statement
data Tree a = Leaf | Node (Tree a) a (Tree a)
repeat :: a -> [a]
repeat x = xs
    where xs = x : xs


{-wrong
-- answer a
repeatTreea x = Node x x x
-}

--right
-- answer b
repeatTree x = Node t x t
    where t = repeatTree x


{-wrong
-- answer c
repeatTreec x = repeatTreec (Node Leaf x Leaf)
-}

{-right
-- answer d
repeatTreed x = Node t x t
    where t = repeatTreed (Node t x t)
-}