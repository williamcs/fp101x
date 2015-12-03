data Tree = Leaf Integer | Node Tree Tree

balanced :: Tree -> Bool

leaves (Leaf _) = 1
leaves (Node l r) = leaves l + leaves r
balanced (Leaf _) = True
balanced (Node l r) = abs (leaves l - leaves r) <= 1 || balanced l || balanced r

balance :: [Integer] -> Tree


{-right
halve xs = splitAt (length xs `div` 2) xs
balance [x] = Leaf x
balance xs = Node (balance ys) (balance zs)
    where (ys, zs) = halve xs
-}

--wrong
halve xs = splitAt (length xs / 2) xs
balance [x] = Leaf x
balance xs = Node (balance ys) (balance zs)
    where (ys, zs) = halve xs


{-wrong
-- answer c
halvec xs = splitAt (length xs `div` 2) xs
balancec [x] = Leaf x
balancec xs = Node ys zs
    where (ys, zs) = balancec (halve xs)
-}

{-wrong
-- answer d
halved xs = splitAt (length xs `div` 2) xs
balanced x = Leaf x
balanced xs = Node (balanced ys) (balanced zs)
    where (ys, zs) = halve xs
-}